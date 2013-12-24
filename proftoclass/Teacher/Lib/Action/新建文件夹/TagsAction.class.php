<?php
class TagsAction extends BaseAction{
		
	public function _tigger_list(&$list){
		//遍历文章信息并追加封装信息
		$m = M("tags");
		foreach($res as &$v){
			//查询对应的tags名称
			$res=$m->query("select t.title from lh_tags tt,lh_tags t where tt.tid=t.id and tt.cid=".$v['id']); 
			$rname=array();
			
			foreach($list as $vb){
				$rname[]=$vb['tags'];
			}
			
			$v['rname']=implode(",",$rname);
		}
	}
	
	public function update(){
		$m = M('tags');
		$id=$_POST["select"];

		foreach($id as $k=>$v){
			$color["color"]=$_POST["tg_color"][$k];
			$m->where("id=".$v)->save($color);
		}
		
		echo "YES";
	}
}
