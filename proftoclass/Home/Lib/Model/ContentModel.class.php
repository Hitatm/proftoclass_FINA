<?php
//定义文章内容类
class ContentModel extends RelationModel{
	protected $_link=array( 
		'User'=> array(  
			'mapping_type'=>BELONGS_TO,
			'foreign_key'=>'uid',		//要查询关联表中的外建名
			'parent_key'=>'id',
			'mapping_fields'=>'pic',	//要查询关联表中的字段名
			'as_fields'=>'pic:photo',

		),		
	);
}





