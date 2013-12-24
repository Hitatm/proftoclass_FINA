<?php
class CommentModel extends RelationModel{
    protected $aaa;
    //关联模型
    protected $_link=array(
        'Content'=> array(
            //关联关系
            'mapping_type'=>BELONGS_TO,
            //外键
            'foreign_key'=>'tid',
            //字段映射
            'mapping_name'=>'Content',
            //获取指定字段
            'mapping_fields'=>'title',
            //更改名称
            'as_fields'=>'title:new',
        ),
    );
}