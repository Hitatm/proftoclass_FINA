<?php 
class UserAction extends BaseAction{


	public function _initialize(){
        
        if(empty($_SESSION['user'])){
            $this->error('请先进行登录！',U('Index/index'));
            return;
        }elseif($_SESSION['user']['id']!=$_GET['id']){
            $this->error('你没有权限访问',U('Index/index'),3);
            return;
        }
        $this->assign("age",explode("|",$_SESSION['user']["age"]));
        $this->assign("mycity",explode("|",$_SESSION['user']["city"]));
    }

    public function index(){
        $m=M("City");
        $this->assign("city",$m->where("type = 1")->select());
        $this->display("index");
    }

    public function user_email(){
        $this->display('user_email');
    }

    public function user_password(){
        $this->display('user_password');
    }


}