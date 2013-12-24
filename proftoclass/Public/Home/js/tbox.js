/***
*名称：创建弹出层插件
*依赖：jQeury
*table：点击事件触发需指定是class还是id
*xid：弹出层容器 必须传入一个存在的ID名
*url：弹出的链接 可指定宽和高
*IE6下存在BUG
*/

//弹出入口函数
function TB_box(table,xid,url){
	$(table).click(function(){
	  TB_show(xid,url);
	  return false;
	});
}
 
//执行弹出操作
function TB_show(xid,url) { 
	try {
		//定义容器变量
		rid=$("#"+xid);
		
		//写入弹出层和关闭按钮
		$("body").append("<div id='TB_overlay'></div>");
		rid.append("<div id='"+xid+"_close' style='cursor:pointer;position: absolute;z-index:9999999'>&nbsp;&nbsp;&nbsp;&nbsp;</div><iframe width='100%' height='100%' frameborder='0' scrolling='no' src='"+url+"'></iframe>");
		
		//当窗口改变时重新定位
		$(window).resize(TB_position);
		
		//获取宽和高
		var queryString = url.replace(/^[^\?]+\??/,'');
		var params = parseQuery(queryString);
		xx=params.width;yy=params.height;
		//初始化弹出层位置并渐入显示
		TB_position();
		rid.width(params.width).height(params.height);
		rid.fadeIn("slow");
	
		//关闭弹出层操作
		$("#"+xid+"_close").live("click",function(){
			TB_remove();
		});
	
	}catch(e){
		alert(e);
	}
}
//关闭弹出层
function TB_remove(){
	rid.fadeOut("fast",function(){
		$('#TB_overlay').remove();
		rid.empty();
	}); 
	return false;
}
//弹出层定位
function TB_position() {

	var ww = $(window).width();var hh = $(window).height();
	
	var xw = (ww-xx)/2;var xh = (hh-yy)/2;

	//弹出层定位
	rid.css("left",xw);rid.css("top",xh);
	//遮蔽层定位
	$("#TB_overlay").width($(document).width()).height($(document).height());
}
//获取宽和高
function parseQuery ( query ) {
   var Params = new Object ();
   //返回空对象
   if ( ! query ) return Params;
   var Pairs = query.split(/[;&]/);
   for ( var i = 0; i < Pairs.length; i++ ) {
      var KeyVal = Pairs[i].split('=');
      if ( ! KeyVal || KeyVal.length != 2 ) continue;
      var key = unescape( KeyVal[0] );
      var val = unescape( KeyVal[1] );
      val = val.replace(/\+/g, ' ');
      Params[key] = val;
   }
   return Params;
}