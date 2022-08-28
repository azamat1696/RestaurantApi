<?php

namespace App\Http\Controllers\SuperAdminApi;

use App\Helpers\FileUploader;
use App\Http\Controllers\Controller;
use App\Http\Requests\SubscribedPlacesRequest;
use App\Models\SubscribedPlaces;
use Illuminate\Http\Request;


class SubscribedPlacesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */

    protected $filePathLogo;
    protected $filePathBanner;

    public function __construct()
    {
        $this->filePathBanner = public_path('uploads/banners');
        $this->filePathLogo = public_path('uploads/logos');
    }

    public function index()
    {
        return response()->json(SubscribedPlaces::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(SubscribedPlacesRequest $request)
    {
        $fileNameBanner = 'no-image.jpg';
        $fileNameLogo = 'no-image.jpg';

        if ($request->hasFile('Banner')){
            $fileBanner = new FileUploader($this->filePathBanner,$request->validated()['Banner'],$request->validated()['PlaceName']);
            $fileNameBanner = $fileBanner->upload();
        }

        if ($request->hasFile('PlaceLogo')){
            $fileLogo = new FileUploader($this->filePathLogo,$request->validated()['PlaceLogo'],$request->validated()['PlaceName']);
            $fileNameLogo = $fileLogo->upload();
        }


        $data = SubscribedPlaces::create( ['Banner' => $fileNameBanner,'PlaceLogo' => $fileNameLogo] + $request->validated());
        return response()->json($data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SubscribedPlaces  $subscribedPlaces
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(SubscribedPlacesRequest $request,$id)
    {

        $data = SubscribedPlaces::find($id);
        $fileNameBanner = $data->Banner;
        $fileNameLogo = $data->PlaceLogo;
        if ($request->hasFile('Banner')){

            if( $data->Banner !== 'no-image.jpg')
            {
                try {
                    unlink($this->filePathBanner."/".$data->Banner);
                } catch (\Exception $e){
                    echo $e;
                }

            }
            $fileBanner = new FileUploader($this->filePathBanner,$request->validated()['Banner'],$request->validated()['PlaceName']);
            $fileNameBanner = $fileBanner->upload();
        }

        if ($request->hasFile('PlaceLogo')){

            if( $data->PlaceLogo  !== 'no-image.jpg')
            {
                try {
                    unlink($this->filePathLogo."/".$data->PlaceLogo);
                } catch (\Exception $e){
                    echo $e;
                }
            }

            $fileLogo = new FileUploader($this->filePathLogo,$request->validated()['PlaceLogo'],$request->validated()['PlaceName']);
            $fileNameLogo = $fileLogo->upload();
        }

        $data->update(['Banner'=>$fileNameBanner,'PlaceLogo'=>$fileNameLogo]+$request->validated());
        return response()->json($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SubscribedPlaces  $subscribedPlaces
     * @return \Illuminate\Http\Response
     */
    public function destroy(SubscribedPlaces $subscribedPlaces,$id)
    {
        $data = SubscribedPlaces::find($id);
          SubscribedPlaces::destroy($id);
        try {
            unlink($this->filePathBanner."/".$data->Banner);
        } catch (\Exception $e){
            echo $e;
        }
        try {
            unlink($this->filePathLogo."/".$data->PlaceLogo);
        } catch (\Exception $e){
            echo $e;
        }
    }
}
