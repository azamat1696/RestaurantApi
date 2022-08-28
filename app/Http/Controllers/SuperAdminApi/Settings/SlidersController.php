<?php

namespace App\Http\Controllers\SuperAdminApi\Settings;
use App\Helpers\FileUploader;
use App\Http\Controllers\Controller;
use App\Http\Requests\SliderRequest;
use App\Models\Sliders;
use Illuminate\Http\Request;

class SlidersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected $filePath;
    public function __construct()
    {
        $this->filePath = public_path('uploads/sliders');

    }

    public function index()
    {
        return response()->json(Sliders::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(SliderRequest $request)
    {
             $fileName = 'no-image.jpg';
             if($request->hasFile('SliderImage'))
             {
                 $slider = new FileUploader($this->filePath,$request->validated()['SliderImage'],$request->validated()['SliderName']);
                 $fileName = $slider->upload();
             }
             $data = Sliders::create(['SliderImage' => $fileName]+$request->validated());
             return response()->json($data);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Sliders  $sliders
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(SliderRequest $request,$id)
    {
        $data = Sliders::find($id);
        $fileName = $data->SliderImage;
        if($request->hasFile('SliderImage'))
        {
            if($fileName !== 'no-image.jpg'){
                try {
                    unlink($this->filePath."/".$fileName);
                } catch (\Exception $e)
                {
                    echo $e;
                }
            }
            $file = new FileUploader($this->filePath,$request->validated()['SliderImage'],$request->validated()['SliderName']);
            $fileName = $file->upload();
        }
        $data->update(['SliderImage' => $fileName]+$request->validated());
        return response()->json($data);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Sliders  $sliders
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Sliders::find($id);
        Sliders::destroy($id);
        try {
            unlink($this->filePath."/".$data->SliderImage);
        } catch (\Exception $e)
        {
            echo $e;
        }

    }
}
