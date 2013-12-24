<?php
class IndexAction extends BaseAction{
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


/*        //查询所有菜单
        $m = D('Models');
        $list = $m->relation('Action')->where("state = 0")->select();
        $this->assign('list',$list);
        //查询默认菜单
        $a= M('Action');
        $alist = $a->where('state = 1')->select();
        $this->assign('alist',$alist);
        //指定模版
        $this->display('index');*/
    }
    
    public function inspect(){

        if(empty($_SESSION['user'])){
            $this->error('请先进行登录！',U('Index/index'));
            return;
        }

        $this->assign("list",$this->getRand());
        $this->display('inspect');
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
        
        $m = D("Teacherdb");
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
        redirect(__ROOT__.'/admin.php/Index/add/state/YES/');
        }else{
            $this->error("添加失败！");
        }       
    }
    
        //获取栏目信息
    public function news(){

        $content=$this->Content_Style();
        $this->assign("list",$content["list"]);
        $this->assign("pages",$content["show"]);

        $this->display("index");
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
   
}
