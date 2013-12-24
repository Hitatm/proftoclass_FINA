<?php
class HomeAction extends Action{
    public function _initialize(){
        //公共标签赋值操作
        $this->assign($this->User_Style());
        $this->assign("action",ACTION_NAME);
		$this->assign($this->Tags_Style());
        $this->assign($this->Lable_Style());
        $this->assign($this->inform());
                        
    }
    //从SESSION中获取会员信息并赋值
    public function User_Style(){
        $array=array();
        $array["user"]=$_SESSION['user'];
        return $array;
    }

    //获取内容信息并赋值
    public function Content_Style(){
        static $array=array();
        if(empty($array) || !empty($_GET["list"])){
            $m = D("Content");
            $c = M("Comment");
            if(!empty($_GET["list"])){
                $where["cid"]=$_GET["list"];
              //  echo "###### $_GET[list]";
            }
            $where["state"]=array("gt",0);
            $pages = $this->_limit($m,$where,C("site_pagesize"));

            $list = $m->relation('User')->where($where)->limit($pages["first"].','.$pages["list"])->select();

            foreach($list as $k=>$v){
                $list[$k]['comments']=$c->where("tid=".$v['id'])->order("num")->select();
            }

            $array['list']=$list;
            $array['show']=$pages["show"];

        }
        return $array;
    }

	//获取标签信息并赋值
	public function Tags_Style(){
		$m = M("Tags");
		$arr=array();
			$arr['tags'] = $m->limit(22)->select();
		return $arr;
	}

    //获取单条信息
    public function getFind($table='',$fid=''){
		$db=empty($table)?$this->getActionName():$table;
		
        $m=M($db);
		
        if(is_numeric($fid)){
            $fid = !empty($id)?$_GET['id']:$fid;
            return $m->where("id = {$fid}")->find();
        }else{
            return "非法参数";
        }
    }

    //审帖随机信息获取
    public function getRand(){
        $m=M("Content");
        $num=$m->where("state < 1 and state > -100")->getField('id',true);
        $rand=count($num)-1;

        //尽量避免重复
        $list=range(0,$rand);
        shuffle($list);

        return $m->where("state < 1 and state > -100 and id=".$num[$list[0]])->find();
    }

    //执行文件上传方法
    public function _doupload($name="Home"){
        import('ORG.Net.UploadFile');
        $upload = new UploadFile();
        $upload->maxSize  = 3145728 ;
        //$upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg');
        $upload->savePath = './Uploads/'.$name.'/'.date("Ymd")."/";
        if(!$upload->upload()) {
            return false;
        }else{
            $info=$upload->getUploadFileInfo();
            $f =M("Files");
            $files['filename']=$info[0]['savename'];
            $files['size']=$info[0]['size'];
            $files['suffix']=$info[0]['extension'];
            $files['dir']=$info[0]['savepath'].$info[0]['savename'];
            $files['addtime']=time();
            $f->add($files);

            $_POST['pic']=ltrim($info[0]["savepath"],".").$info[0]["savename"];
            return $info;
        }
    }

    //执行分页方法
    public function _limit($User,$where,$pages){
        import('ORG.Util.Page');// 导入分页类
        $count  = $User->where($where)->count();// 查询满足要求的总记录数
        $Page   = new Page($count,$pages);// 实例化分页类 传入总记录数和每页显示的记录数
        $show   = $Page->show();// 分页显示输出
        $array['show']=$show;
        $array['first']=$Page->firstRow;
        $array['list']=$Page->listRows;
        return $array;
    }

    //地图页标签定义
    public function Lable_Maps($limit,$page,$table="Content"){
        $rs = M($table);
        $list = $rs->order('addtime desc')->limit($limit)->page($page)->select();
        if($list){
            foreach($list as $key=>$v){
                $arr[]["url"] = geturl($v["id"]);
                $arr[]["time"] = $v["addtime"];
                $arr[]["desc"] = $v["desc"];
                $arr[]["title"] = $v["title"];
                $arr[]["author"] = $v["author"];
            }
            return $arr;
        }
        return false;
    }

    //全局标签定义
    public function Lable_Style(){
        $array=array();
        $array['sitename']=C("site_name");
        $array['siteurl']=C("site_url");

        return $array;
    }


    public function inform(){
      $inf=M("Time");
      $data=$_SESSION['user'];
      $username= (int)$data['username']/100000;
      $var=(int)$username;
      $this->assign('var',$var);
      $shit=$inf->where("grade=$var")->select();
      /*var_dump($shit);*/
      $this->assign('shit',$shit);
      $data;
    }


}