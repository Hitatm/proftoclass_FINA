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

    //自定义跳转页面
    'TMPL_ACTION_SUCCESS' => 'Public:jump',
    'TMPL_ACTION_ERROR' => 'Public:jump',
);

return array_merge($arr1,$arr2);
?>
