<?php
class SettimeAction extends BaseAction{
    
    //扩展：搜索条件封装方法
    public function _filter(&$map){
        if(!empty($_GET['keyword'])){
            $map['content']=array('like',"%{$_GET['keyword']}%");
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



    public function index()
    {
       /* $m=M("City");
        $this->assign("city",$m->where("type = 1")->select());*/
        $this->display("index");
    }

 /*   public function index(){
        $empty='<dl class="comment"><dt><span>暂无记录。</span></dt></dl>';
        $this->assign("empty",$empty);
        parent::index();
    }
*/
    public function insert(){
        $m=M('Time');

        if(!empty($_GET['starttime1']) && !empty($_GET['stoptime1'])){
            $m->time1start= $_GET['starttime1'];
            $m->time1end  = $_GET['stoptime1'];
            
            //$map['addtime']= array(array('gt',$start),array('lt',$stop));
        }

        if(!empty($_GET['starttime2']) && !empty($_GET['stoptime2'])){
            $m->time2start = $_GET['starttime2'];
            $m->time2end = $_GET['stoptime2'];
        }

        if(!empty($_GET['starttime3']) && !empty($_GET['stoptime3'])){
            $m->time3start = $_GET['starttime3'];
            $m->time3end = $_GET['stoptime3'];
        }

        if(!empty($_GET['starttime4']) && !empty($_GET['stoptime4'])){
            $m->time4start = $_GET['starttime4'];
            $m->time4end = $_GET['stoptime4'];
        }

        $m->grade=$_GET['age1'] ;
        $m->times=$_GET['age2'] ;

        $m->content=$_GET['content'];     
        $count=$m->add();
        if($count>0)
       {
           $this->success("数据修改成功O(∩_∩)O~");
       } 
       else
       {
           $this->error('数据修改失败╮(╯▽╰)╭');
       } 
    }
}
/*if($_POST["state"]==1){
            $_POST["state"]=1;
            $m->where("id=".$_POST['id'])->save($_POST);
        }else{
            $_POST["state"]=0;
            $m->where("id=".$_POST['id'])->save($_POST);
        }*/