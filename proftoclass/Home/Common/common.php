<?php
//获取模板位置
function MB($file){
	$m = C('default_theme').'/'.trim($file).'.html';
	return $m;
}

/*-------------------------------------------------路径及生成静态函数------------------------------------------------------------------*/
//获取模生成模板
function getmname($mid='',$aid=''){
    if(empty($mid) && empty($aid)){
        return "Category:index";
    }elseif(!empty($mid) && empty($aid)){
        return ucfirst($mid).":index";
    }elseif(!empty($mid) && !empty($aid)){
        return ucfirst($mid).":".$aid;
    }else{
        return false;
    }
}

//获取模型名称
function getlist($name=''){
    return "栏目";
}

//获取完整的UrL
function geturl($id,$name="content"){
    return __ROOT__."/index.php/Index/news/".$name."/".$id;
}