<?php
class PubuliuAction extends HomeAction{

	public function index(){
		$list = M('techerdb')->select();
		$this->assign('count',count($list));
		//var_dump(count($list))  ;
		$this->display("list");
	}
	
	
	public function fun(){

		$maxpage=0;
		$m = M('teacherdb'); // 实例化pul对象

		import('ORG.Util.Page');// 导入分页类
			
		$count= $m->where()->count();// 查询总记录数
		$Page= new Page($count,100);// 实例化分页类 传入总记录数和每页显示的记录数
		$maxpage=ceil($count/10);
		$show = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $m->limit($Page->firstRow.','.$Page->listRows)->select();
	
		//判断传过来的页数和最大页数的系									
		if($_GET['p']<=$maxpage){
			foreach($list as $v){
			
				   echo   "<div class='item'>
					<div class='item1'>
					

					</div>
					<a href='#'> <img id='img{$v['id']}' src='".__ROOT__."/{$v['pic']}'/> </a>
					<div style='position:absolute;width: 300px;z-index:10'>
					<a href='".__APP__."/Pubuliu/teacherinfo/teachername/{$v['teachername']}'>{$v['teachername']}</a>
					</div>
					<div class='aaa' style='display:none'>".$maxpage."</div>						
				</div>";
				 			
			}
		}		
	}


     public function teacherinfo(){

             $m=M('Teacherdb');
             $value=$_GET['teachername'];
             
             $condition['teachername']=$value;

             $n=$m->where($condition)->select();

             $this->assign('hello',$n);
              
             $this->display('teacherinfo');
     }













}

/*
				<div class='operation'>
						<a class='optionbtn PF_textga o_left01 pin_bt' save href='javascript:;' onclick=\"myup('up_{$v['id']}','{$v['id']}')\" title='顶'>
							<i class='PF_icon PF_icon97'></i>+1<span id='up_{$v['id']}'></span></a>

						<a  href='javascript:;' class='optionbtn PF_textga o_left01 pin_bt save' onclick=\"myup('down_{$v['id']}','{$v['id']}')\" title='踩'>
							<i class='PF_icon PF_icon106'></i>-1<span id='down_{$v['id']}'></span></a>
							
						
				</div>*/