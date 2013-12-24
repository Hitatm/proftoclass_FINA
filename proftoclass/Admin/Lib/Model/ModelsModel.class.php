<?php
class ModelsModel extends RelationModel{
    //定义关联模型查询
    protected $_link=array(
        'Action'=> array(
            'mapping_type'=>HAS_MANY,
            'parent_key' => 'id',
            'foreign_key' => 'mid',
            'mapping_name'=>'Action',
			//控制模型中的Action是否显示
            'condition' => 'display = 0',
       ),
    );
}