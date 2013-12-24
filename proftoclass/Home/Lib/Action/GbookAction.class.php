<?php
class GbookAction extends Action{
    public function add(){
        $this->display("add");
    }

    public function insert(){
        if(empty($_POST)){
            echo "<script>window.parent.location.reload();</script>";exit;
        }
        $m=D("Gbook");
        if(!$m->create()){
            $this->error($m->getError());
        }

        if($m->add()){
            $jumpUrl="YES";
            $this->success("留言成功！","YES");
        }
    }
}