<?php
class SetAction extends BaseAction{


      public function _initialize(){
                  if(empty($_SESSION['user'])){
                   $this->error('请先进行登录！',U('Index/index'));
                      return;
                   }
     }
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

    public function add(){

        $data=$_SESSION['user'];
        $n=M('Teacherdb');

        $condition['teachername'] = $data['name'];

        $m= $n->where($condition)->find();
/*echo "<pre>";
        var_dump($m);
echo "<pre>"; */
   if($m)
   {     
                    $m['tid']=$data['id'];

                    $time = date("Y-m-d", NOW_TIME);
                    $m['addtime']=$time;       
                        if(!empty($_GET['starttime1']) and $_GET['starttime1']>$time){
                            $m['tim1']= $_GET['starttime1'];
                            $m['times']= $m['times']+1;

                        if(!empty($_GET['starttime2']) and $_GET['starttime2']>$time){
                            $m['tim2']= $_GET['starttime2'];
                            $m['times']= $m['times']+1;
                        
                        if(!empty($_GET['starttime3']) and $_GET['starttime3']>$time){
                            $m['tim3']= $_GET['starttime3'];
                            $m['times']=$m['times']+1;
                             }
                         } 
                        
                      $count=$n->save($m);
                        if($count>0) 
                        {   
                            $this->success("时间设定成功O(∩_∩)O~"); 
                        }    
                        else
                        {
                            $this->error('时间设定失败，请稍后重试╮(╯▽╰)╭');
                        }
                    }
                    else{
                                $this->error('设定失败请稍后重试╮(╯▽╰)╭ Ps:请核对您设定的时间不合逻辑呀？');
                           } 
                   
        } else
        $this->error('您尚未被加入名师库请联系管理员 ╮(╯▽╰)╭');
        

        /*if($_GET['starttime1']<$time or $_GET['starttime2']<$time or $_GET['starttime3']<$time )
           var_dump($time);*/
        
/*        if($count>0){
           $this->success("时间设定成功O(∩_∩)O~");
       } */
       
    }


}