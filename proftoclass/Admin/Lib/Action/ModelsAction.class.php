<?php 
class ModelsAction extends BaseAction{

	public function index(){
        $m=M("Models");
        $list=$m->select();
        $this->assign("list",$list);
        $this->display("index");
	}

    public function off(){
        $m=M("Models");
        $data["state"]=1;
        if($m->where("id=".$_GET["id"])->save($data)){
            echo "YES";
        }
    }

    public function on(){
        $m=M("Models");
        $data["id"]=$_GET["id"];
        $data["state"]=0;
        if($m->where("id=".$_GET["id"])->save($data)){
            echo "YES";
        }
    }

    //使用自定义关联查询成功，虽然参数比较多
    public function update(){
        $where["id"]=$_GET['id'];
        $list=$this->_link("Models","Action","action","id","mid",$where);
        $this->assign("list",$list);
        $this->display("update");
    }

    //执行动作修改操作
    public function doupdate(){
        $m=M("Models");
        $a=M("Action");
        $start=$a->where("mid=".$_POST['mid'])->getField("id",true);

        $data["title"]=$_POST["title"];
        $data["desc"]=$_POST["desc"];
        $action=$_POST["action"];

        $m->where("id=".$_POST['mid'])->save($data);
        //模块权限保存
        foreach($start as $v){
            if(in_array($v,$action)){
                $date['display']=0;
                $a->where("id=".$v)->save($date);
            }else{
                $date['display']=1;
                $a->where("id=".$v)->save($date);
            }
        }
    }
}