<?php
$arr1 = require("./Public/conf/config.php");
$arr2 = array(
    'db_type' => 'mysql',
    'db_host' => 'localhost',
    'db_name' => 'proftoclass',
    'db_user' => 'root',
    'db_pwd' => '',
    'db_port' => '3306',
    'db_prefix' => 'cs_',
    'db_charset' => 'utf8',
    //url不区分大小写
    'URL_CASE_INSENSITIVE' => true,
    'TMPL_L_DELIM'=>'<{',
    'TMPL_R_DELIM'=>'}>',
    'VAR_PAGE'=>'pageNum',

        'TMPL_ENGINE_TYPE'     => 'Smarty',
    //url不区分大小写
    'URL_CASE_INSENSITIVE' => true,
    //模板引擎相关的设置
    'TMPL_ENGINE_CONFIG'   => array(
        //是否缓存模板
        'caching'          => false,
        //模板目录
        'template_dir'     => TMPL_PATH,
        //模板编译目录
        'compile_dir'      => CACHE_PATH,
        //缓存目录
        'cache_dir'        => TEMP_PATH,
        //左定界符
        'left_delimiter'   => '<{',
        //右定界符
        'right_delimiter'  => '}>',
    ),
    'VAR_PAGE'=>'pageNum',
    //静态缓存路径
    'HTML_FILE_SUFFIX'=>'.html',

    //自定义跳转页面
    'TMPL_ACTION_SUCCESS' => 'Public:jump',
    'TMPL_ACTION_ERROR' => 'Public:jump',

    'MAIL_ADDRESS'=>'hit2011jsj@163.com', // 邮箱地址
    'MAIL_SMTP'=>'smtp.163.com', // 邮箱SMTP服务器
    'MAIL_LOGINNAME'=>'hit2011jsj@163.com', // 邮箱登录帐号
    'MAIL_PASSWORD'=>'hit2011', // 邮箱密码
    'MAIL_SENDER'=>'名师小班行网站管理员', //发件人名字
);

return array_merge($arr1,$arr2);
?>
