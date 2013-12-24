<?php
/**
 * Info:生成静态缓存执行类
 * User: huisel
 * Time: 2013年8月5日
 */
class CreateAction extends HomeAction{

    public function _initialize(){
		if(!$_SESSION['userinfo']){
			$this->error("你没有权限！");
		}
        
		parent::_initialize();
    }

    //生成网站首页
    public function index(){
        $content=$this->Content_Style();
        $this->assign("list",$content["list"]);
        $this->assign("pages",$content["show"]);
        if($this->buildHtml("index",'./','Index:index')){
            $this->success("生成首页成功！");
        }
    }

	//生成栏目方法Lable_Vod_Read公共变量
    public function dolist(){
        static $array=array();
        //获取生成数据
        if(empty($array)){
			$m=M("Category");
			if($_GET['action']=='ALL'){
                $array = $m->where(1)->select();
			}else{
                $array = $m->where("id={$_GET['id']}")->select();
			}
        }

        $count=count($array);

        //准备生成条件
        $pages=C("html_cahce_page");
        $totalpages=ceil($count/$pages);
        $pp=empty($_GET['pp'])?1:$_GET['pp'];
        $s = ($pp-1)*$pages;
        $t = $s+$pages-1;
        //显示执行过程
        echo'<ul id="show" style="font-size:12px;list-style:none;margin:0px;padding:0px;font-family:宋体">';
        echo'<li>总共需要生成<font color=red>'.$count.'</font>个'.getlist($_GET['model']).'页，需要分<font color=red>'.$totalpages.'</font>次来执行，正在执行第<font color=red>'.$pp.'</font>次</li>';

        //开始生成
		for($i=$s;$i<=$t;$i++){
            //拼装生成信息
            $html=explode("|",C('html_list_url'));
            $rhtml = stristr($html[1],'{');
            $lhtml = rtrim($html[1],$rhtml);

            $hname=str_replace('{listid}','id',"{listid}");

            if(!empty($lhtml)){
                $hname=$lhtml.$array[$i][$hname];
            }

            if($i<$count){
                //执行生成
			    $this->buildHtml($hname,$html[0],getmname());
                echo '<li>第<font color="red">'.($i+1).'</font>个生成完毕　<a href="'.__ROOT__.C('html_list_url').C('html_file_suffix').'" target="_blank">'.$html[0].$hname.C('html_file_suffix').'</a></li>';
                ob_flush();flush();
            }

		}
		echo'</ul>';

        if($i>$count){
            //提示生成完毕
            $this->success("生成列表页完毕！",'./admin.php?m=Pages&a=html',3);
        }

        //提示服务器休息
        if($i>=C('html_cahce_page') && $i<$count){
            $pp++;
            $this->success("服务器休息中".C('html_cahce_time')."秒钟后继续生成",'./index.php?m=Create&a=dolist&action='.$_GET['action'].'&pp='.$pp,C('html_cahce_time'));
        }
    }

    public function maps(){
        $this->baidu(false);
        $this->rss(false);
        $this->success("所有地图生成完毕！");
    }

    //生成Baidu地图
    public function baidu($state=true){
        $all = $this->_count("Content");
        $count = !empty($_REQUEST['baidu'])?intval($_REQUEST['baidu']):5000;
        $page = ceil($all/$count);
        for($i=1;$i<=$page;$i++){
            $this->map_create('baidu',$count,$i);
        }
        if ($state) {
            $this->success('Baidu Sitemap地图生成成功！请通过<a href="http://sitemap.baidu.com" style="color:#000" target="_blank">百度站长平台</a>提交！');
        }
    }

    //生成RSS订阅
    public function rss($state=true){
        $rss = !empty($_REQUEST['rss'])?intval($_REQUEST['rss']):50;
        for($i=1;$i<=1;$i++){
            $this->map_create('rss',$rss,1);
        }
        if ($state) {
            $this->success('Rss订阅文件生成成功！');
        }
    }

	//生成地图页
	public function map_create($mapname,$limit,$page){
		$listmap = $this->Lable_Maps($limit,$page);
		if($listmap){
			$this->assign($this->Lable_Style());
			$this->assign('maps',$listmap);
            C('html_file_suffix',".xml");
			if ($page == 1){
				$this->buildHtml($mapname,C('url_map'),'Public:'.$mapname);
			}else{
				$this->buildHtml($mapname.'-'.$page,C('url_map'),'Public:'.$mapname);
			}
		}
    }

    //获取总数据条数
    public function _count($table,$where=1){
        $m=M($table);
        return $m->where($where)->count();
    }
}