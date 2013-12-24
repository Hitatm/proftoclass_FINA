<?php 
class UserAction extends BaseAction{
	
	//搜索方法(_filter是公共类中的方法)
	public function _filter(&$map){
		if(isset($_GET["by"]) && isset($_GET["key"])){
			$map[$_GET["by"]]=array('like',"%{$_GET['key']}%");
		}
	}
	
	public function add(){
		$m = M("Group");
			$this->assign("glist",$m->select());
			parent::add();
	}
	
	
	public function index(){
        $empty='<tr><td colspan="7" align="center">暂无记录。</td></tr>';
        $this->assign("empty",$empty);
		$_POST['actionName']='model';
		parent::index();
	}
	
	public function edit(){
		$m = M("Group");
		$this->assign("glist",$m->select());
		parent::edit();
	}
	
	public function delete(){
		$m = M("user");
		$id = $_REQUEST["id"];
		
		//拼装删除信息的主键id值（以数组方式拼装）
		$condition = array("id" => array('in', explode(',', $id)));
		if(false!== $m->where($condition)->delete()) 
		parent::delete();
	}
}