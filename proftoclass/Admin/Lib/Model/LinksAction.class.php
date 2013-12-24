<?php
class LinksModel extends Model{
    protected $_validate=array(
        array("url","require","URL不能为空"),
        array("title","require","标题不能为空"),
    );
}