<?php
	class LoginAction extends BaseAction{
		public function index(){
			$this->display("index");
		}
		//执行登陆
		public function login(){
			$user = $_POST['username'];
			$pass = md5($_POST['password']);

			//查询所需信息
			$m=M("User");
			$n=M("Relagn");
			$a=M("Node");
			$arr=$m->where("username='{$user}' and password='{$pass}' and state > 10")->find();
            $arr["ip"]=$_SERVER["REMOTE_ADDR"];

			if($arr){
                //为SESSION赋值
                $_SESSION['userinfo']=$arr;

                //获取权限信息
                $nid=$n->where("gid=".$arr["gid"])->getField("nid",true);

                foreach($nid as $v){
                    $node[]=$a->where("id=".$v)->find();
                }

                foreach($node as $vv){
                    $nodelist[$vv["mname"]][]=$vv["aname"];
                }

                //拼装完成后追加赋给SESSION
                $_SESSION["userinfo"]["nodelist"]=$nodelist;

                //添加日志记录
                $this->addlogs(4,$this->getActionName());

				echo 'YES|'.$arr['id'];
			}else{
				echo "error";
				$_SESSION['userinfo'] = false;
			}
		}
        

        public function dologin(){
		//接受表单提交过来的值

		//用户的判断
		$m = M("user");
		$where['username']=$_POST['username'];
		$where['password']=md5($_POST['password']);
        $where['gid']='2';
		$row = $m->where($where)->find();

		if($row){
			$_SESSION['user']=$row;
			echo "<div class='login' id='indexLogin'>
                <div class='cont'>
                    <div class='inner clr'>
                        <img alt='{$row['name']}' src='".__ROOT__."{$row['pic']}' width='48' height='48'>
                        <p>
                            <a href='#' title='{$row['name']}' style='display: block;width: 200px'>{$row['username']}</a>
                            <span>欢迎登录本系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='./admin.php?m=Login&a=loginout'>退出登录</a></span>
                        </p>
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


  



		/*//退出登录
		public function loginout(){
			$_SESSION['userinfo']=false;
		}*/

            //执行退出
	    public function loginout(){
	        unset($_SESSION['user']);
	        redirect(__ROOT__."/admin.php");
	    }

		//加载登录状态
		public function status(){
			if($_SESSION['userinfo']){
				echo '<img id="face" src="./uploads/user/735951354083439.png" title="#" />
				<a class="homepage" href="#" target="_blank" title="访问首页"></a>
				<a href="javascript:void(0);" class="loginout" title=""></a>';
			}else{
				echo '<img src="'.__ROOT__.'/Public/Admin/system/skins/error_no_rights.png" />游客...';
			}
		}
    }
?>