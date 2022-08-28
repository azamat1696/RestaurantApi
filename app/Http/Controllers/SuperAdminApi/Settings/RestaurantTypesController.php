<?php

namespace App\Http\Controllers\SuperAdminApi\Settings;

use App\Helpers\FileUploader;
use App\Http\Requests\RestaurantRequest;
use App\Models\RestaurantTypes;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

class RestaurantTypesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public $filePath;
    public function __construct()
    {
        $this->filePath = public_path('/uploads/restTypeBanners');
    }

    public function index()
    {
        return response()->json(RestaurantTypes::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(RestaurantRequest $request)
    {

        $fileName = 'no-image.jpg';
        if($request->hasFile('Banner'))
        {
            $fileBanner = new FileUploader($this->filePath,$request->validated()['Banner'],$request->validated()['RestName']);
            $fileName = $fileBanner->upload();
        }
        $item = RestaurantTypes::create(['Banner'=> $fileName ]+$request->validated());
        return response()->json($item);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(RestaurantRequest $request, $id)
    {
        $fileName = 'no-image.jpg';
        $item = RestaurantTypes::findOrFail($id);
        if($request->hasFile('Banner'))
        {
            if ($item->Banner !== 'no-image.jpg')
            {
                try {
                    unlink($this->filePath."/".$item->Banner);
                } catch (\Exception $exception)
                {
                    echo $exception;
                }
            }
            $fileBanner = new FileUploader($this->filePath,$request->validated()['Banner'],$request->validated()['RestName']);
            $fileName = $fileBanner->upload();
        }
        $item->update(['Banner' => $fileName]+$request->validated());
        return response()->json($item);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        RestaurantTypes::destroy($id);
    }
}
