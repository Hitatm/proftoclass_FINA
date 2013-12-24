<?php
class MessageAction extends BaseAction{

      public function _initialize(){
                  if(empty($_SESSION['user'])){
                   $this->error('请先进行登录！',U('Index/index'));
                      return;
                   }
     }

    public function index(){
        $m=M("Message");
        $u=M("User");
        if(isset($_GET)){
            $uu=$u->where("name like '%{$_GET['keyword']}%'")->getField("id");
            if(!empty($uu) && $_GET['by']=="fname"){
                $where['uid']=$uu;
            }elseif(!empty($uu) && $_GET['by']=="sname"){
                $where['mid']=$uu;
            }elseif(empty($uu)){
                $where['mid']="灰色L";
            }
        }else{
            $where=1;
        }

        import("ORG.Util.Page");

        $Page = new Page($m->where($where)->count(),10);

        $list=$m->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();

        foreach($list as $k=>$v){
            $list[$k]["fname"]=$u->where("id=".$v["uid"])->getField("name");
            $list[$k]["sname"]=$u->where("id=".$v["mid"])->getField("name");
        }

        $empty='<tr><td colspan="7" align="center">暂无记录。</td></tr>';
        $this->assign("empty",$empty);
        $this->assign("show",$Page->show());
        $this->assign("list",$list);
        $this->display("index");
    }
}