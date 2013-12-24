<?php
class GbookAction extends BaseAction{
    //扩展：搜索条件封装方法
    public function _filter(&$map){
        if(!empty($_GET['keyword'])){
            $map['content']=array('like',"%{$_GET['keyword']}%");
			echo "sadfsdf";
        }
        //封装时间查询条件
        if(!empty($_GET['starttime']) && !empty($_GET['stoptime'])){
            $start = strtotime($_GET['starttime']);
            $stop  = strtotime($_GET['stoptime']);
            $map['addtime']= array(array('gt',$start),array('lt',$stop));
        }

        if(!empty($_GET['starttime']) && empty($_GET['stoptime'])){
            $start = strtotime($_GET['starttime']);
            $map['addtime']= array('gt',$start);
        }

        if(!empty($_GET['stoptime']) && empty($_GET['starttime'])){
            $stop  = strtotime($_GET['stoptime']);
            $map['addtime']= array('lt',$stop);
        }
    }

    public function index(){
        $empty='<dl class="comment"><dt><span>暂无记录。</span></dt></dl>';
        $this->assign("empty",$empty);
        parent::index();
    }

    public function update(){
        $m=M("Gbook");
        if($_POST["state"]==1){
            $_POST["state"]=1;
            $m->where("id=".$_POST['id'])->save($_POST);
        }else{
            $_POST["state"]=0;
            $m->where("id=".$_POST['id'])->save($_POST);
        }
    }
}