<?php
class LoginAction extends BaseAction{

	public function index(){
		$this->display();
	}
	
	public function dologin(){
		//接受表单提交过来的值

		//用户的判断
		$m = M("user");
		$where['username']=$_POST['username'];
		$where['password']=($_POST['password']); //md5

		$row = $m->where($where)->find();

		if($row){
			$_SESSION['user']=$row;
			echo "<div class='login' id='indexLogin'>
                <div class='cont'>
                    <div class='inner clr'>
                        <a href='./index.php?m=User&a=index&id={$row['id']}' title='{$row['name']}'><img alt='{$row['name']}' src='".__ROOT__."{$row['pic']}' width='48' height='48'></a>
                        <p>
                            <a href='./index.php?m=User&a=index&id={$row['id']}' title='{$row['name']}' style='display: block;width: 200px'>{$row['username']}</a>
                            <span>欢迎登录本系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='./teacher.php?m=Login&a=loginout'>退出登录</a></span>
                        </p>
                    </div>
                    <a href='./index.php?m=User&a=index&id={$row['id']}' class='in-f clr'><span class='myself'>更改设置请戳这里</span><i></i></a>
                </div>
				<script>
				$('.cuid').val({$row['id']});
				$('.cuname').val('{$row['name']}');
				$('.cupic').val('{$row['pic']}');
				</script>
            </div>";
		}else{
			echo 'ERR';
		}
	}

    //执行用户退出
    public function loginout(){
        unset($_SESSION['user']);
        redirect(__ROOT__."/teacher.php");
    }
  //执行用户注册
    public function res(){
        if(!empty($_POST)){
            $m=D("User");

            if(!$m->create()){
                $this->error($m->getError());
            }

            $m->addtime = date("Y-m-d", NOW_TIME);

            if($user=$m->add()){
                $_SESSION['user']=$m->where("id=".$user)->find();
                echo "<script>window.parent.location.reload()</script>";
            }
        }
        $this->display("res");
    }
}