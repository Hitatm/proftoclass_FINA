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
    //系统公共配置
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

);

return array_merge($arr1,$arr2);
?>
