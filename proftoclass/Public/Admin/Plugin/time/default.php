<?php
class time extends PluginAction{

	//插件信息设置
	public $param=array(

	);

	//自动调用方法
	public function run(){
		//返回插件模板
		return $this->getHtml();
	}
}