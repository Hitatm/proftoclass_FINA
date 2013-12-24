<?php
class ContentAction extends BaseAction{
	//搜索方法
	public function _filter(&$map){
		if(isset($_GET["type"]) && !empty($_GET["type"])){
			$map['cid']=$_GET["type"];
		}

        if(isset($_GET["keyw"]) && !empty($_GET["keyw"])){
            $map['title']=array("like","%{$_GET['keyw']}%");
        }

	}
	//使用回掉函数对查询的内容进行替换
	public function _tigger_list(&$list){
		$m=M("category");
		foreach($list as $k=>$v){
			$list[$k]["cid"]=$m->where("id=".$v["cid"])->getField("title");
		}
	}
	public function index(){
		$m = M("category");
		$list1 = $m->select();
		$_POST['actionName']='model';
		$empty='<tr><td colspan="6" align="center">暂无记录。</td></tr>';
		$this->assign("empty",$empty);
		$this->assign("list1",$list1);
		parent::index();
		
	}
	
	public function add(){
		$m = M("category");
		$list1 = $m->select();
		$this->assign("list1",$list1);
		parent::add();
	}

	public function insert(){
		$_POST["cid"]=$_POST["ct_cid"];
        if(!empty($_POST["ct_summary"])){
		    $_POST["desc"]=$_POST["ct_summary"];
        }else{
            $_POST["desc"]=substr($_POST["ct_content"],0,100);
        }
		$_POST["content"]=$_POST["ct_content"];
		$n=M("tags");
		$tags['title'] = $_POST["tags"];
		$list3 = $n->add($tags);

        parent::insert();
	}

	public function edit(){
		$m = M("category");
		$list1 = $m->select();
		$this->assign("list1",$list1);
		parent::edit();
	}

    public function update(){
        $_POST["desc"]=$_POST["ct_summary"];
        $m=M("Content");
        $start=$m->getField("id",true);
        $action=explode(",",$_GET["id"]);

        foreach($action as $v){
            if($_GET["type"]=="fixed_1"){
                $date['soft']=1;
                $m->where("id=".$v)->save($date);
            }elseif($_GET["type"]=="fixed_0"){
                $date['soft']=0;
                $m->where("id=".$v)->save($date);
            }
        }
        parent::update();
    }
}
?>