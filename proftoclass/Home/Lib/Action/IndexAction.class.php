<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends  HomeAction{
	
    public function index(){
	
        //判断是否安装
        /*if (!is_file('./Runtime/Install/install.lock')) {
            $this->assign("jumpUrl",'index.php?m=Admin&a=Install');
            $this->error('您还没安装本程序，请运行 install.php 进入安装!');
        }*/
		
        //判断是否是静态模式
        if(C('url_html')==1){
            redirect('index'.C('html_file_suffix'));
        }

        //使用公共方法获得所需的文章内容
        $content=$this->Content_Style();
        $this->assign("list",$content["list"]);
        $this->assign("pages",$content["show"]);

        $this->display("index");
    }
	
	//获取投稿表单
	public function add(){
		if(empty($_SESSION['user'])){
            $this->error('亲,请先登录！',U('Index/index'));
            return;
        }
	
		$this->display("add");
	}	
	
	//执行投稿添加
	public function insert(){
        if($this->_doupload()){
            echo "<script>alert('文件上传失败)</script>";
        }
		
		if(!empty($_POST['pic'])){
			$_POST['cid']=3;
			
		}else if(empty($_POST['pic'])){
			$_POST['cid']=2;
		} 
		
		$m = D("Content");
		if(!$m->create()){ 
			$this->error($m->getError());
		}
		
		$n =M('tags');
		
		$list= array();
		$arr = explode("，",$_POST["tags"]);
		foreach ($arr as $v){
			$v=trim($v);
			if(!$n->where("title='{$v}'")->find()){
				$tags['title'] = $v;
				$n->add($tags);
			}
		}
		if($m->add()){
		redirect(__ROOT__.'/index.php/Index/add/state/YES/');
		}else{
			$this->error("添加失败！");
		}		
	}

    //审帖需要登录
    public function inspect(){

        if(empty($_SESSION['user'])){
            $this->error('请先进行登录！',U('Index/index'));
            return;
        }

        $this->assign("list",$this->getRand());
        $this->display('inspect');
    }

    //执行审帖操作
    public function dospect(){
        $m=M("Content");
        $v=$m->where("id=".$_GET['id'])->getField("state");
        if($v>-100){
            $data['state']=$v+$_GET['vote'];
            if($arr=$m->where("id=".$_GET['id'])->save($data)){
                echo json_encode($this->getRand());
            }
        }else{
            $arr["state"]="ERR";
            echo json_encode($arr);
        }
    }
	
	//顶的方法
	public function doup(){
		//判断是否登录 没有登录不允许顶踩
		if($_SESSION['user']==''){
			echo "login";
		}else{
            if(cookie('up_'.$_GET['id'])!=10){
                //获取顶踩
                $data = $_GET["up"];
                $data = strstr($data,"_");
                $data = rtrim($_GET["up"],$data);

                $id = $_GET['id'];
                $m = M("content");
                $list = $m->where('id='.$id)->getField($data);
                $list++;
                $res[$data]=$list;
                $vo = $m->where("id=".$id)->save($res);
                if($vo){
                    cookie('up_'.$id,10,3600);
                    echo $list;
                }
            }else{
                echo "ERR";
            }
	    }
    }
	//评论的方法
	public function talk(){
		
		if($_SESSION['user']==''){
			echo "login";
		}else{
			$m = D("comment");
			$lou=$m->where("tid=".$_POST['tid'])->select("num");
			$num=$lou?$lou+1:1;
			$_POST['num']=$num;
			$m->create();
            $l = M("lou");
            //通过另外一个表来实现的字段自增效果
            if($l->where("tid=".$_POST['tid'])->getField("num")){
                $lou=$l->where("tid=".$_POST['tid'])->getField("num");
                $data['num']=$lou+1;
                $l->where("tid=".$_POST['tid'])->save($data);
            }else{
                $data["tid"]=$_POST['tid'];
                $data["num"]=1;
                if(!$l->add($data)){
                    return false;
                }
            }

        $_POST['num']=$data['num'];
        $m->create();
			$id = $m->add();
			
			echo json_encode($this->getFind("Comment",$id));
		}
	}
	
	//搜索的方法
	public function sear(){
		$m = D("Content");
        $c = M("Comment");
        
		$where["content"]=array("like","%{$_GET['kw']}%");
		$pages = $this->_limit($m,$where,2);
        $list = $m->relation('User')->where($where)->limit($pages["first"].','.$pages["list"])->select();

		foreach($list as $k=>$v){
			$list[$k]['comments']=$c->where("tid=".$v['id'])->order("num")->select();
		}
		$this->assign("num",count($list));
        $this->assign("list",$list);
        $this->assign("pages",$pages["show"]);
        $this->display("sear");
	}

    //获取栏目信息
    public function news(){

        $content=$this->Content_Style();
        $this->assign("list",$content["list"]);
        $this->assign("pages",$content["show"]);

        $this->display("index");
    }
    //小班行简介的展示
    public function introduce()
    {     
     
      $this->display("introduce");
    }
}