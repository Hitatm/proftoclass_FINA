<?php
/*-------------------------------------------------文件夹与文件操作开始------------------------------------------------------------------*/
//读取文件
function read_file($l1){
    return @file_get_contents($l1);
}
//写入文件
function write_file($l1, $l2=''){
    $dir = dirname($l1);
    if(!is_dir($dir)){
        mkdirss($dir);
    }
return @file_put_contents($l1, $l2);
}
//递归创建文件
function mkdirss($dirs,$mode=0777){
    if(!is_dir($dirs)){
        mkdirss(dirname($dirs), $mode);
        return @mkdir($dirs, $mode);
    }
    return true;
}
// 数组保存到文件
function arr2file($filename, $arr=''){
    if(is_array($arr)){
        $con = var_export($arr,true);
    }else{
        $con = $arr;
    }

    $con = "<?php\nreturn $con;\n?>";
    write_file($filename, $con);
}

//获取日志操作model
function getLogsName($name){
    switch(strtolower($name)){
        case "login":
            $res="囧老大系统";
            break;
        case "action":
            $res="菜单节点";
            break;
        case "category":
            $res="网站栏目";
            break;
        case "comment":
            $res="评论信息";
            break;
        case "content":
            $res="站内文章";
            break;
        case "files":
            $res="附件信息";
            break;
        case "gbook":
            $res="留言信息";
            break;
        case "group":
            $res="用户组信息";
            break;
        case "links":
            $res="友情连接";
            break;
        case "logs":
            $res="操作日志";
            break;
        case "message":
            $res="站内信息";
            break;
        case "models":
            $res="模型信息";
            break;
        case "tags":
            $res="标签信息";
            break;
        case "user":
            $res="会员信息";
            break;
		case "config":
            $res="系统配置";
            break;
    }
    return $res;
}

//获取日志操作类型
function getlogs($type){
    switch($type){
        case 1:
            $res="增加了";
            break;
        case 2:
            $res="删除了";
            break;
        case 3:
            $res="修改了";
            break;
        case 4:
            $res="登录了";
            break;
    }
    return $res;
}

//转换时间戳
function mytime($time){
    return date("Y-m-d H:i:s",$time);
}


/**********
 * 发送邮件 *
 **********/
function SendMail($address,$title,$message)
{
    vendor('PHPMailer.class#phpmailer');

    $mail=new PHPMailer();
    // 设置PHPMailer使用SMTP服务器发送Email
    $mail->IsSMTP();

    // 设置邮件的字符编码，若不指定，则为'UTF-8'
    $mail->CharSet='UTF-8';

    // 添加收件人地址，可以多次使用来添加多个收件人
    $mail->AddAddress($address);

    // 设置邮件正文
    $mail->Body=$message;

    // 设置邮件头的From字段。
    $mail->From=C('MAIL_ADDRESS');

    // 设置发件人名字
    $mail->FromName=C('MAIL_SENDER');
    // 设置邮件标题
    $mail->Subject=$title;

    // 设置SMTP服务器。
    $mail->Host=C('MAIL_SMTP');

    // 设置为“需要验证”
    $mail->SMTPAuth=true;

    // 设置用户名和密码。
    $mail->Username=C('MAIL_LOGINNAME');
    $mail->Password=C('MAIL_PASSWORD');

    // 发送邮件。
    return($mail->Send());
}
