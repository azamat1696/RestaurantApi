<?php

namespace App\Helpers;



use Illuminate\Support\Str;

class FileUploader
{
    protected $path;
    protected $fileName;
    protected $file;
    public function __construct($path,$file,$fileName)
    {
        $this->path = $path;
        $this->file = $file;
        $this->fileName = Str::slug($fileName) . "-" . rand(100,999999) . ".".$file->extension();
    }
    public function upload(){
        $this->file->move($this->path,$this->fileName);
        return $this->fileName;
    }
}
