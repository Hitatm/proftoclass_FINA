<?php
class UserModel extends Model{
    protected $_auto=array(
        array("password","md5",1,"function"),
        array("addtime","time",1,"function")
    );

    protected $_validate=array(
        array("username","require","账号必须填写！"),
        array("username","","账号已经存在！",0,"unique",1),
        array("password","require","密码必须填写！"),
        array("password2","password","确认密码不正确",0,"confirm"),
        array("email","email","请输入正确邮箱"),
    );
}