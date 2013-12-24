<?php
class GroupAction extends BaseAction{
    public function _initialize(){
        $m=M("Node");
        $slist=$m->where("status >0")->select();
        $this->assign("slist",$slist);
        parent::_initialize();
    }

    public function index(){
        $empty='<tr><td colspan="4" align="center" style="padding-top:15px;padding-bottom:15px;">暂无记录。</td></tr>';
        $this->assign("empty",$empty);
        parent::index();
    }

    public function insert(){
        parent::insert();
    }

    public function edit(){
        $where["id"]=$_GET["id"];
        $list=$this->_link("Group","Relagn","list","id","gid",$where);
        $n=M("Node");
        //获取当前用户的权限列表用来选中默认权限
        foreach($list as $k=>$vo){
            foreach($vo["list"] as $v){
                $node[]=$n->where("id=".$v["nid"])->getField("id");
            }
        }

        $this->assign("node",$node);
        //dump($node);
        parent::edit();
    }

    public function update(){
        $n=M("Relagn");
        $rights=$_POST['rights'];
        $gid=$_POST["id"];
        $res=$n->where("gid=".$gid)->getField("nid",true);
        if(!empty($rights)){
            //确保只添加一次
            foreach($rights as $v){
                if(!in_array($v,$res)){
                    $date["gid"]=$gid;
                    $date["nid"]=$v;
                    $n->add($date);
                }
            }

            //删除勾掉的权限
            $diff=array_diff($res,$rights);
            if($diff){
                foreach($diff as $d){
                    $n->where("nid=".$d)->delete();
                }
            }
        }else{
            //权限列表为空时删除所有权限
            $n->where("gid=".$gid)->delete();
        }
        parent::update();
    }
}