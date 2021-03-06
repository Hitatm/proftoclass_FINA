<?php 
class ActionAction extends HomeAction{
    public function _initialize(){
        if(empty($_SESSION['user'])){
            $this->error('请先进行登录！',U('Index/index'));
            return;
        }
    }
	public function user_email(){
		$m=M('User');
        $pass=md5($_POST['password']);
		if(!empty($_POST['email']) && $_SESSION['user']['password']==$pass){
            //创建数据，清空password
            unset($_POST['password']);$m->create();
			if($m->save()){
                $_SESSION['user'] = $m->where("id=".$_POST['id'])->find();
				echo 'YES';
			}else{
                echo "ERR";
            }
		}else{
            echo '请输入正确的密码！';
        }
	}

    public function user_city(){
        $m=M("City");
        echo json_encode($m->where("fid=".$_GET['id'])->select());
    }

    public function user_update(){
        $m=M("User");
        $c=M("City");
        $_POST['id']=$_SESSION['user']['id'];
        $_POST['age']="|".$_POST['age'][0]."|".$_POST['age'][1]."|".$_POST['age'][2];
        $_POST['city']="|".$c->where("id=".$_POST['city'][0])->getField('name')."|".$c->where("id=".$_POST['city'][1])->getField('name')."|".$c->where("id=".$_POST['city'][2])->getField('name')."|".$_POST['city'][0]."|".$_POST['city'][1]."|".$_POST['city'][2];

        if(!$m->create()){
            $this->error($m->getError());
        }

        if($m->save()){
            $_SESSION['user'] = $m->where("id=".$_POST['id'])->find();
            echo 'YES';
        }else{
            echo "ERR";
        }
    }
	
	//用户修改密码的方法
	public function dopassword(){
		$m = M('user');
		$_POST['id'] = $_SESSION['user']['id'];
		$oldpass = md5($_POST['oldpass']);
		$newpass = md5($_POST['newpass']);
		$newpass1 = md5($_POST['newpass1']);
		
		if(!empty($oldpass) && !empty($newpass)){
			if($oldpass==$_SESSION['user']['password']){
				if($newpass == $newpass1){
					$_POST['password']=$newpass;
					$m->create();
					if($m->save()){
						$_SESSION['user'] = $m->where("id=".$_POST['id'])->find();
						echo "YES";
					}
				}else{
					echo "两次输入的密码不相同";
				}
			}else{
				echo "输入的密码与原密码不符";
			}
		}else{
			echo "密码不能为空";
		}
	}

    //用户上传方法
    public function upload(){
        if($pic=$this->_doupload()){
            $npic=ltrim($pic[0]['savepath'],'.').$pic[0]['savename'];
            $_SESSION['user']['pic']=$npic;
            $m=M("user");
            $_POST['pic']=$npic;
            $m->create();
            if(!$m->save()){
                echo "<script>alert('图片保存失败！')</script>";
            }else{
                echo "<script>
                　if(confirm('头像保存成功！')){
                　		window.parent.location.reload();
                　	}
                </script>";
            }
        }else{
            echo "<script>alert('图片上传失败！')</script>";
        }
    }
}