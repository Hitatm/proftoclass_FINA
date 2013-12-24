<?php
class UploadAction extends BaseAction{
	//执行文件上传页面显示
	public function index(){
        echo json_encode($this->dofile($_POST["dir"]));
	}
}