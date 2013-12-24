<?php
class MydbAction extends BaseAction{
	public function index(){
        $res=new Model();
        $list = $res->query('SHOW TABLES FROM '.C('db_name'));
        $tablearr = array();
        foreach ($list as $key => $val) {
            $tablearr[$key+1] = current($val);
        }

        $this->assign('mlist',$tablearr);
        $this->display('index');
    }

    //处理数据库备份
    public function domysql(){
        if(empty($_POST['name'])){
            echo "ERR";
        }

        //预留分卷大小功能
        $filesize = 2048;
        if ($filesize < 512) {
            $this->error('出错了,请为分卷大小设置一个大于512的整数值！');
        }

        //数据库备份目录
        $file = DATA_PATH.'_bak/';
        $rand = rand(1000, 9999);
        $sql = '';
        $p = 1;
        foreach($_POST['name'] as $table){
            //循环替换掉表前缀
            $res = D(str_replace(C('db_prefix'),'',$table));
            $array = $res->select();
            $sql.= "TRUNCATE TABLE `$table`;\n";

            //生成SQL
            foreach($array as $value){
                $sql.= $this->insertsql($table, $value);
                if (strlen($sql) >= $filesize*1000) {
                    $filename = $file.date('Ymd').'_'.$rand.'_'.$p.'.sql';
                    //拼装文件名写入sql，并初始化
                    write_file($filename,$sql);
                    $p++;
                    $sql='';
                }
            }
        }

        //如果小于一卷大小直接写
        if(!empty($sql)){
            $filename = $file.date('Ymd').'_'.$rand.'_'.$p.'.sql';
            write_file($filename,$sql);
        }

        echo "YES";
    }

    //生成SQL备份语句
    public function insertsql($table, $row){
        $sql = "INSERT INTO `{$table}` VALUES (";
        $values = array();
        foreach ($row as $value) {
            $values[] = "'" . mysql_real_escape_string($value) . "'";
        }
        $sql .= implode(', ', $values) . ");\n";
        return $sql;
    }

    //展示还原
    public function show(){
        $filepath = DATA_PATH.'_bak/*.sql';
        $filearr = glob($filepath);
        if (!empty($filearr)) {
            foreach($filearr as $k=>$sqlfile){
                preg_match("/([0-9]{8}_[0-9a-z]{4}_)([0-9]+)\.sql/i",basename($sqlfile),$num);
                $res[$k]['filename'] = basename($sqlfile);
                $res[$k]['filesize'] = round(filesize($sqlfile)/(1024*1024), 2);
                $res[$k]['addtime'] = date('Y-m-d H:i:s', filemtime($sqlfile));
                $res[$k]['pre'] = $num[1];
                $res[$k]['number'] = $num[2];
                $res[$k]['path'] = DATA_PATH.'_bak/';
            }
            $this->assign('list',$res);
            $this->display('show');
        }else{
            $this->error('没有检测到备份文件,请先备份或上传备份文件到'.DATA_PATH.'_bak/',__APP__."?m=Mydb&a=index");
        }
    }

    //导入还原未测试
    public function back(){
        $res = new Model();
        $pre = $_GET['id'];
        //获取卷号
        $fileid = $_GET['fileid'] ? intval($_GET['fileid']) : 1;
        $filename = $pre.$fileid.'.sql';
        $filepath = DATA_PATH.'_bak/'.$filename;
		
		//如果文件存在则循环执行Sql语句
        if(file_exists($filepath)){
            $sql = read_file($filepath);
            $sql = str_replace("\r\n", "\n", $sql);
            foreach(explode(";\n", trim($sql)) as $query) {
                $res->query(trim($query));
            }
            $jumpurl=__APP__."?m=Mydb&a=back&id=".$pre."&fileid=".($fileid+1);
            $this->success('第'.$fileid.'个备份文件恢复成功,准备恢复下一个,请稍等！',$jumpurl);
        }else{
            echo "YES";
        }
    }

    //删除分卷文件
    public function del(){
        $filename = trim($_GET['id']);
        @unlink(DATA_PATH.'_bak/'.$filename);
        $this->success($filename.'已经删除！',__APP__."?m=Mydb&a=show");
    }
}