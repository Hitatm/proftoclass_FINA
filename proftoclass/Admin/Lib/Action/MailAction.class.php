<?php
class MailAction extends BaseAction{


    public function _initialize(){
                  if(empty($_SESSION['user'])){
                   $this->error('请先进行登录！',U('Index/index'));
                      return;
                   }
     }
	public function index(){
        /*$res=new Model();
        $list = $res->query('SHOW TABLES FROM '.C('db_name'));
        $tablearr = array();
        foreach ($list as $key => $val) {
            $tablearr[$key+1] = current($val);
        }

        $this->assign('mlist',$tablearr);*/
        $this->display('add');
    }
    
  public function add()
  {

      $title=$_POST['title'];
      $email=$_POST['email'];
      $content=$_POST['content'];
      SendMail("$email","$title","$content");
      if($title=''or $email=''or$content='')
        $this->error('数据不完整请核对后重新发送');
      else
      $this->success("邮件成功O(∩_∩)O~");
  }

}

   
