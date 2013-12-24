<?php
class InviteAction extends HomeAction{

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
        $this->display();
    }

    public function find()
    {
        $n=M('Teacherdb');
        $condition['teachername'] = $_GET['name'];
        /*var_dump($_GET['name']);*/
        if(!empty($_GET['name']) and !empty($_GET['starttime']) && !empty($_GET['stoptime']))
        {
            
            $model=$n->where($condition)->select();

            if($model and ($model['tim1']>=$_GET['starttime'] or $model['tim3']<=$_GET['stoptime']))
            {
               
               $this->assign('hello',$model);
                                
                $this->display();
            }
             
             else
             {

               $this->error("╮(╯▽╰)╭ 请核对查询条件");
             }

        }
        else
        {
          /* echo "<{foreach $list as $m}> <p>
                                   <{$m[name]}>教授本学期可预约时间为:</br>
                                   '<{if $m[tim1]!=''}>' 推荐时间1: <{$m[tim1]}> <{/if}></br>
                                   '<{if $m[tim2]!=''}>' 推荐时间2: <{$m[tim2]}> <{/if}></br>
                                   '<{if $m[tim3]!=''}>' 推荐时间3: <{$m[tim3]}> <{/if}></br> 
                                    <{/foreach}></p>" ;
                          */
/*        $condition['teachername'] = $data['name'];

<{foreach $list as $m}>
         <{$m.name}>教授本学期可预约时间为:</br>
         <{if $m.tim1!=''}> 推荐时间1: <{$m[tim1]}> <{/if}></br>
         <{if $m.tim2!=''}> 推荐时间2: <{$m[tim2]}> <{/if}></br>
         <{if $m.tim3!=''}> 推荐时间3: <{$m[tim3]}> <{/if}></br> 
<{/foreach}>
        $m= $n->where($condition)->find();*/
         $this->success("数据修改成功O(∩_∩)O~",'index');

        }
    }
}