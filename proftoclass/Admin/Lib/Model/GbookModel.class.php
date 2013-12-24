<?php
class GbookModel extends Model{
    protected $_validate=array(
        array("name","require","称呼必须填写！"),
        array("email","email","请填写正确的邮箱！"),
        array("content","require","内容必须填写！"),
    );

    protected $_auto=array(
        array("addtime","time",1,"function"),
        array("ip","getip",1,"callback"),
    );

    public function getip(){
        return $_SERVER["REMOTE_ADDR"];
    }
}