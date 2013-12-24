<?php
//定义用户组Model类
class UserModel extends RelationModel{
	protected $_link=array(
		'Group'=> array(  
			//通过查找User表中的name字段和gid关联到group表中的id
			'mapping_type'=>BELONGS_TO,
			'foreign_key'=>'gid',
			'mapping_name'=>'dept',
			'mapping_fields'=>'name',
			'as_fields'=>'name:gname',
		),
	);
}