-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 12 月 22 日 10:28
-- 服务器版本: 5.5.32
-- PHP 版本: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `proftoclass`
--
CREATE DATABASE IF NOT EXISTS `proftoclass` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `proftoclass`;

-- --------------------------------------------------------

--
-- 表的结构 `cs_category`
--

CREATE TABLE IF NOT EXISTS `cs_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 自增',
  `pid` int(11) DEFAULT '0',
  `order` int(11) DEFAULT '1',
  `path` varchar(255) NOT NULL DEFAULT '0,',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(200) DEFAULT '0' COMMENT '0为站内链接，其他则为站外链接',
  `title` varchar(100) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0',
  `navlist` tinyint(1) NOT NULL DEFAULT '0',
  `desc` varchar(100) DEFAULT NULL COMMENT '文章分类描述',
  `addtime` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `cs_category`
--

INSERT INTO `cs_category` (`id`, `pid`, `order`, `path`, `type`, `url`, `title`, `state`, `navlist`, `desc`, `addtime`) VALUES
(1, 0, 1, '0,', 1, 'www.baidu.com', '穿越', 0, 0, 'erer122', NULL),
(2, 0, 1, '0,', 0, '0', '文', 0, 0, NULL, NULL),
(3, 0, 1, '0,', 0, '0', '图', 0, 0, NULL, NULL),
(10, 1, 1, '0,', 0, '', 'fasdfa', 0, 0, NULL, NULL),
(4, 0, 1, '0,', 0, '0', '事', 0, 0, NULL, NULL),
(11, 0, 1, '0,', 0, '', '槽', 0, 0, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cs_comment`
--

CREATE TABLE IF NOT EXISTS `cs_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 自增',
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `state` tinyint(1) DEFAULT '0' COMMENT '0：正常  1:删除',
  `pic` varchar(100) NOT NULL,
  `num` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `ip` int(64) DEFAULT NULL,
  `addtime` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- 转存表中的数据 `cs_comment`
--

INSERT INTO `cs_comment` (`id`, `uid`, `tid`, `name`, `email`, `url`, `state`, `pic`, `num`, `content`, `ip`, `addtime`) VALUES
(1, 2, 3, '刘阳', 'sdadas@qq.com', '111', 0, '', 1, NULL, NULL, NULL),
(2, 1, 5, '刘阳', 'sdadas@qq.com', '111', 0, '', 1, NULL, NULL, NULL),
(3, 2, 4, '11刘阳', 'sdadas@qq.com', '111', 0, '', 1, NULL, NULL, NULL),
(4, 32, 39, '灰色L', '', '', 0, '', 1, '日日日', NULL, NULL),
(5, 32, 39, '灰色L', '', '', 0, '', 2, '日日日', NULL, NULL),
(6, 32, 39, '灰色L', '', '', 0, '', 2, '日日日哥哥', NULL, NULL),
(7, 32, 39, '灰色L', '', '', 0, '', 2, '日日日广告歌', NULL, NULL),
(8, 32, 39, '灰色L', '', '', 0, '', 1, '我来说两句...asdasdsa', NULL, NULL),
(9, 32, 39, '灰色L', '', '', 0, '', 1, 'asdasd', NULL, NULL),
(10, 32, 39, '灰色L', '', '', 0, '', 1, 'asdasdsad', NULL, NULL),
(11, 32, 39, '灰色L', '', '', 0, '', 1, 'asdsadsad', NULL, NULL),
(12, 32, 39, '灰色L', '', '', 0, '', 1, 'asdsadsadgg', NULL, NULL),
(13, 32, 39, '灰色L', '', '', 0, '', 1, '1231231', NULL, NULL),
(14, 32, 39, '灰色L', '', '', 0, '', 2, 'sadasdas', NULL, NULL),
(15, 32, 39, '灰色L', '', '', 0, '', 2, 'dasdasd', NULL, NULL),
(16, 32, 39, '灰色L', '', '', 0, '', 2, 'dasdasdsa', NULL, NULL),
(17, 32, 38, '灰色L', '', '', 0, '', 1, 'adsadsadsadas', NULL, NULL),
(18, 32, 38, '灰色L', '', '', 0, '', 8, 'asdasdasdsa', NULL, NULL),
(19, 32, 38, '灰色L', '', '', 0, '', 9, 'asdsada', NULL, NULL),
(20, 32, 38, '灰色L', '', '', 0, '', 10, 'asdasdasd', NULL, NULL),
(21, 32, 39, '灰色L', '', '', 0, '', 22, 'asdsad', NULL, NULL),
(22, 32, 39, '灰色L', '', '', 0, '', 23, 'asada', NULL, NULL),
(23, 32, 39, '灰色L', '', '', 0, '', 24, 'dasda', NULL, NULL),
(24, 32, 37, '灰色L', '', '', 0, '', 1, 'dasdsadasd', NULL, NULL),
(25, 32, 37, '灰色L', '', '', 0, '', 2, 'dasdasd', NULL, NULL),
(26, 32, 37, '灰色L', '', '', 0, '', 3, 'dasdasd', NULL, NULL),
(27, 32, 36, '灰色L', '', '', 0, '', 1, 'sadasdasd', NULL, NULL),
(28, 32, 36, '灰色L', '', '', 0, '', 2, 'asdasd', NULL, NULL),
(29, 32, 36, '灰色L', '', '', 0, '', 3, 'dasdas', NULL, NULL),
(30, 32, 41, '灰色L', '', '', 0, '', 1, '撒但是撒旦', NULL, NULL),
(31, 32, 41, '灰色L', '', '', 0, '', 2, '撒大实打实', NULL, NULL),
(32, 32, 41, '灰色L', '', '', 0, '', 3, '撒大似的撒', NULL, NULL),
(33, 32, 38, '灰色L', '', '', 0, '', 11, '啊实打上的', NULL, NULL),
(34, 32, 36, '灰色L', '', '', 0, '', 4, '我来说两句...啊实打上的', NULL, NULL),
(35, 32, 36, '灰色L', '', '', 0, '', 5, '我来说两句...啊实打上的', NULL, NULL),
(36, 32, 36, '灰色L', '', '', 0, '', 6, '我来说两句...啊实打上的', NULL, NULL),
(37, 32, 36, '灰色L', '', '', 0, '', 7, '我来说两句...啊实打上的', NULL, NULL),
(38, 32, 39, '灰色L', '', '', 0, '', 25, '我来说两句...问问', NULL, NULL),
(39, 32, 43, '灰色L', '', '', 0, '', 1, '我来说两句...风格风格', NULL, NULL),
(40, 32, 43, '灰色L', '', '', 0, '', 2, '广告歌', NULL, NULL),
(41, 32, 37, '灰色L', '', '', 0, '', 4, '第三方第四范式地方史蒂芬森地方', NULL, NULL),
(42, 32, 37, '灰色L', '', '', 0, '', 5, '第三啊实打实打算', NULL, NULL),
(43, 32, 41, '灰色L', '', '', 0, '', 4, '啊实打实打三', NULL, NULL),
(44, 32, 44, '灰色L', '', '', 0, '', 1, '撒的撒大湿', NULL, NULL),
(45, 32, 44, '灰色L', '', '', 0, '', 2, '啊实打上的', NULL, NULL),
(46, 32, 43, '灰色L', '', '', 0, '', 3, '大三大四', NULL, NULL),
(47, 32, 43, '灰色L', '', '', 0, '', 4, '啊实打水', NULL, NULL),
(48, 32, 46, '灰色L', '', '', 0, '', 1, '是大大水', NULL, NULL),
(49, 32, 46, '灰色L', '', '', 0, '', 2, '大三大三大', NULL, NULL),
(50, 32, 45, '灰色L', '', '', 0, '', 1, '我来说两句啊实打谁打撒...', NULL, NULL),
(51, 32, 46, '灰色L', '', '', 0, '', 3, 'ddfdfd ', NULL, NULL),
(52, 0, 46, '', '', '', 0, '', 4, '我来说两句...awww', NULL, NULL),
(53, 32, 46, '灰色L', '', '', 0, '', 5, 'dsadasd', NULL, NULL),
(54, 32, 46, '灰色L', '', '', 0, '', 6, '我来说两句...asdasd', NULL, NULL),
(55, 32, 46, '灰色L', '', '', 0, '', 7, '我来说两句...asdasd', NULL, NULL),
(70, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 4, '我来说两句...sss', NULL, NULL),
(57, 32, 46, '灰色L', '', '', 1, '/Uploads/Home/20130813/520911d89d978.jpg', 9, 'sdsdd..', NULL, NULL),
(58, 32, 46, '灰色L', '', '', 1, '/Uploads/Home/20130813/520911d89d978.jpg', 10, 'asdsadsa我来说两句...', NULL, NULL),
(59, 32, 46, '灰色L', '', '', 1, '/Uploads/Home/20130813/520911d89d978.jpg', 11, 'adsadasdasd', NULL, NULL),
(60, 32, 45, '灰色L', '', '', 1, '/Uploads/Home/20130813/520911d89d978.jpg', 2, '我来说两句...asdasd', NULL, NULL),
(61, 32, 46, '灰色L', '', '', 0, '/Uploads/Home/20130813/520911d89d978.jpg', 12, '我来说两句...asdsadasd', NULL, NULL),
(62, 32, 44, '灰色L', '', '', 0, '/Uploads/Home/20130813/520911d89d978.jpg', 3, 'sadsadasd', NULL, NULL),
(63, 32, 43, '灰色L', '', '', 0, '/Uploads/Home/20130813/520911d89d978.jpg', 5, '我来说两句...sadsads', NULL, NULL),
(64, 32, 40, '灰色L', '', '', 0, '/Uploads/Home/20130813/520911d89d978.jpg', 1, '我来说两句...gtt', NULL, NULL),
(65, 32, 39, '灰色L', '', '', 0, '/Uploads/Home/20130813/520911d89d978.jpg', 26, '我来说两句...yyyy', NULL, NULL),
(66, 32, 40, '灰色L', '', '', 0, '/Uploads/Home/20130813/520911d89d978.jpg', 2, '我来说两句...yyyyy', NULL, NULL),
(67, 32, 40, '灰色L', '', '', 0, '/Uploads/Home/20130813/520911d89d978.jpg', 3, '我来说两句...yyyyy', NULL, NULL),
(68, 32, 40, '灰色L', '', '', 0, '/Uploads/Home/20130813/520911d89d978.jpg', 4, 'yyyyyyyyyy', NULL, NULL),
(69, 32, 41, '灰色L', '', '', 1, '/Uploads/Home/20130813/520911d89d978.jpg', 5, '我来说两句11111', NULL, NULL),
(71, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 5, 'dsadsadsa', NULL, NULL),
(72, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 6, '我来说两句...dsadasd', NULL, NULL),
(73, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 7, 'asdasdasd', NULL, NULL),
(74, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 8, '我来说两句...sadasdasd', NULL, NULL),
(75, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 9, 'asdsadasd', NULL, NULL),
(76, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 10, '我来说两句...', NULL, NULL),
(77, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 11, 'asdsadasd', NULL, NULL),
(78, 48, 44, '', '', '', 0, '/Public/Home/images/jiong.png', 12, 'asdsadasdasdasdas', NULL, NULL),
(79, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 13, '我来说两句...', NULL, NULL),
(80, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 14, '在来说两句...', NULL, NULL),
(81, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 15, '在来说两句...ss', NULL, NULL),
(82, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130818/52109e719dea4.gif', 16, '我来说两句...', NULL, NULL),
(83, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130819/5211040f8c1b1.jpg', 17, 'dsfvsdfs', NULL, NULL),
(84, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130819/5211040f8c1b1.jpg', 18, '/hklnm,ipk'',bnkl', NULL, NULL),
(90, 33, 26, '恒毅', '', '', 0, '/Uploads/Home/20130821/521453f2926b0.jpg', 1, '丰功硕', NULL, NULL),
(86, 1, 56, '灰色L', '', '', 0, '/Uploads/Home/20130819/5211040f8c1b1.jpg', 1, '我来说两啊实打说的V', NULL, NULL),
(87, 1, 56, '灰色L', '', '', 0, '/Uploads/Home/20130819/5211040f8c1b1.jpg', 2, '啊实打上的', NULL, NULL),
(88, 1, 54, '灰色L', '', '', 0, '/Uploads/Home/20130819/5211040f8c1b1.jpg', 2, '啊实打上的', NULL, NULL),
(89, 1, 44, '灰色L', '', '', 0, '/Uploads/Home/20130820/521389e5e7baa.jpg', 19, 'gsdfgsfd ', NULL, NULL),
(91, 1, 30, '灰色L', '', '', 0, '/Uploads/Home/20130820/521389e5e7baa.jpg', 1, ' 我fgfgfgf', NULL, NULL),
(93, 1, 26, '灰色L', '', '', 0, '/Uploads/Home/20130821/521456875f3e0.jpg', 2, 'aasdsadasd', NULL, NULL),
(94, 53, 36, '', '', '', 0, '/Public/Home/images/jiong.png', 8, '我来说两句...撒的撒的 ', NULL, NULL),
(95, 53, 118, '1103105', '', '', 0, '/Uploads/Home/20131205/529fda927eb76.JPG', 1, 'jjjjjjjjjj', NULL, NULL),
(96, 53, 106, '我', '', '', 0, '/Uploads/Home/20131205/529fda927eb76.JPG', 1, '我来说两句...aa ', NULL, NULL),
(97, 58, 104, '呵呵', '', '', 0, '/Public/Home/images/jiong.png', 1, '我来说两句...bggg', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cs_content`
--

CREATE TABLE IF NOT EXISTS `cs_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '1',
  `cid` int(11) NOT NULL COMMENT '内容组别',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `desc` varchar(200) DEFAULT NULL COMMENT '文章描述',
  `keyword` varchar(100) NOT NULL,
  `content` text NOT NULL COMMENT '文章内容',
  `pic` varchar(100) NOT NULL,
  `tags` varchar(32) NOT NULL,
  `author` varchar(100) NOT NULL DEFAULT '管理员',
  `state` tinyint(11) NOT NULL DEFAULT '0' COMMENT '新闻稿状态 0:未审核 1：审核 2：回收站',
  `soft` tinyint(1) DEFAULT '0' COMMENT '推荐状态 0：不推荐',
  `check` int(1) DEFAULT '0' COMMENT '点击量',
  `up` int(11) DEFAULT '0',
  `down` int(11) DEFAULT '0',
  `addtime` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=128 ;

--
-- 转存表中的数据 `cs_content`
--

INSERT INTO `cs_content` (`id`, `uid`, `cid`, `title`, `desc`, `keyword`, `content`, `pic`, `tags`, `author`, `state`, `soft`, `check`, `up`, `down`, `addtime`) VALUES
(106, 53, 3, '是', NULL, '', '撒地方', '/Uploads/Home/20131205/529fdac63b52d.jpg', '好', '灰色L', 1, 0, 0, 2, 0, NULL),
(109, 54, 3, 'ss', NULL, '', 'sdfsssdf', '/Uploads/Home/20131205/52a0779c08a61.jpg', 'ssssss', '灰色L', 1, 0, 0, 1, 0, NULL),
(92, 53, 3, '1', NULL, '', '1', '/Uploads/Home/20131204/529ec56154fe2.jpg', '1', '灰色L', 1, 0, 0, 2, 0, NULL),
(94, 53, 3, '1', NULL, '', '1', '/Uploads/Home/20131204/529ec58d0c5c6.jpg', '1', '灰色L', 1, 0, 0, 0, 0, NULL),
(95, 53, 3, '1', NULL, '', '1', '/Uploads/Home/20131204/529ec5973c5ad.jpg', '1', '灰色L', 1, 0, 0, 0, 0, NULL),
(96, 53, 3, '速度', NULL, '', '发萨达发生的', '/Uploads/Home/20131204/529ed25fb771d.jpg', '是', '灰色L', 1, 0, 0, 0, 0, NULL),
(116, 53, 3, '啊啊啊啊啊啊啊啊啊', NULL, '', '啊啊啊啊啊', '/Uploads/Home/20131207/52a2e01bbb20d.jpg', '啊啊啊啊啊啊啊啊啊啊啊啊啊', '管理员', 1, 0, 0, 0, 0, NULL),
(100, 53, 3, '是啊', NULL, '', '事哈哈！', '/Uploads/Home/20131204/529f2e8545bc2.jpg', '哈哈', '灰色L', 1, 0, 0, 0, 0, NULL),
(101, 53, 3, '', NULL, '', '', '/Uploads/Home/20131204/529f2eba0a2b3.jpg', '', '灰色L', 1, 0, 0, 0, 0, NULL),
(104, 53, 3, '按时', NULL, '', '请填写新闻内容萨达发生 ', '/Uploads/Home/20131204/529f332dd0755.jpg', '阿什顿', '灰色L', 1, 0, 0, 1, 0, NULL),
(105, 53, 3, '撒旦', NULL, '', '撒地方撒地方撒地方撒旦法第三方撒地方', '/Uploads/Home/20131204/529f338602a87.jpg', '撒旦', '灰色L', 1, 0, 0, 0, 1, NULL),
(89, 53, 3, '曹组系统', NULL, '', '操作系统的一些算法总结\r\n\r\n一、进程(作业)调度算法\r\nl         先来先服务调度算法（FCFS）：每次调度是从就绪队列中，选择一个最先进入就绪队列的进程，把处理器分配给该进程，使之得到执行。该进程一旦占有了处理器，它就一直运行下去，直到该进程完成或因发生事件而阻塞，才退出处理器。特点：利于长进程，而不利于短进程。 \r\n\r\nl         短进程（作业）优先调度算法(SPF)：它是从就绪队列中选择一个估计运行时间最短的进程，将处理器分配给该进程，使之占有处理器并执行，直到该进程完成或因发生事件而阻塞，然后退出处理器，再重新调度。 \r\n\r\nl         时间片轮转调度算法 ：系统将所有的就绪进程按进入就绪队列的先后次序排列。每次调度时把CPU分配给队首进程，让其执行一个时间片，当时间片用完，由计时器发出时钟中断，调度程序则暂停该进程的执行，使其退出处理器，并将它送到就绪队列的末尾，等待下一轮调度执行。 \r\n\r\nl         优先数调度算法 ：它是从就绪队列中选择一个优先权最高的进程，让其获得处理器并执行。 \r\n\r\nl         响应比高者优先调度算法：它是从就绪队列中选择一个响应比最高的进程，让其获得处理器执行，直到该进程完成或因等待事件而退出处理器为止。特点：既照顾了短进程，又考虑了进程到达的先后次序，也不会使长进程长期得不到服务，因此是一个比较全面考虑的算法，但每次进行调度时，都需要对各个进程计算响应比。所以系统开销很大，比较复杂。 \r\n\r\nl         多级队列调度算法\r\n\r\n基本概念：\r\n\r\n   作业周转时间（Ti）＝完成时间(Tei)－提交时间(Tsi)\r\n\r\n   作业平均周转时间(T)＝周转时间/作业个数\r\n\r\n   作业带权周转时间（Wi）＝周转时间/运行时间\r\n\r\n   响应比＝（等待时间＋运行时间）/运行时间\r\n\r\n二、存储器连续分配方式中分区分配算法\r\nn         首次适应分配算法（FF）：对空闲分区表记录的要求是按地址递增的顺序排列的，每次分配时，总是从第1条记录开始顺序查找空闲分区表，找到第一个能满足作业长度要求的空闲区，分割这个空闲区，一部分分配给作业，另一部分仍为空闲区。 \r\n\r\nn         循环首次适应算法：每次分配均从上次分配的位置之后开始查找。 \r\n\r\nn         最佳适应分配算法(BF)：是按作业要求从所有的空闲分区中挑选一个能满足作业要求的最小空闲区，这样可保证不去分割一个更大的区域，使装入大作业时比较容易得到满足。为实现这种算法，把空闲区按长度递增次序登记在空闲区表中，分配时，顺序查找。 \r\n\r\n三、页面置换算法\r\nl         最佳置换算法（OPT) ：选择以后永不使用或在最长时间内不再被访问的内存页面予以淘汰。\r\n\r\nl         先进先出置换算法（FIFO）：选择最先进入内存的页面予以淘汰。 \r\n\r\nl         最近最久未使用算法（LRU）：选择在最近一段时间内最久没有使用过的页，把它淘汰。 \r\n\r\nl         最少使用算法（LFU）：选择到当前时间为止被访问次数最少的页转换。\r\n\r\n四、磁盘调度\r\nn         先来先服务（FCFS）：是按请求访问者的先后次序启动磁盘驱动器，而不考虑它们要访问的物理位置\r\n\r\nn         最短寻道时间优先（SSTF）：让离当前磁道最近的请求访问者启动磁盘驱动器，即是让查找时间最短的那个作业先执行，而不考虑请求访问者到来的先后次序，这样就克服了先来先服务调度算法中磁臂移动过大的问题\r\n\r\nn         扫描算法（SCAN）或电梯调度算法：总是从磁臂当前位置开始，沿磁臂的移动方向去选择离当前磁臂最近的那个柱面的访问者。如果沿磁臂的方向无请求访问时，就改变磁臂的移动方向。在这种调度方法下磁臂的移动类似于电梯的调度，所以它也称为电梯调度算法。\r\n\r\nn         循环扫描算法（CSCAN）：循环扫描调度算法是在扫描算法的基础上改进的。磁臂改为单项移动，由外向里。当前位置开始沿磁臂的移动方向去选择离当前磁臂最近的哪个柱面的访问者。如果沿磁臂的方向无请求访问时，再回到最外，访问柱面号最小的作业请求。\r\n\r\n\r\n\r\n操作系统向用户提供了以下三种类型的接口。\r\n\r\n　　(1)命令接口\r\n\r\n　　按命令接口对作业控制方式的不同，命令接口包括联机命令接口和脱机命令接口两种类型。其中联机命令接口由终端处理程序、命令解释程序和一组联机命令组成：终端处理程序负责接收用户输入的终端命令，并将它显示在终端屏幕上;命令解释程序对接收到的命令进行识别，并调用相应命令的处理程序，以完成请求任务;操作系统则通过提供多条联机命令向用户提供各方面的服务。脱机命令接口由作业控制语言JCL组成，它向用户提供了一组作业控制命令。\r\n\r\n　　(2)程序接口\r\n\r\n　　程序接口即系统调用，它适用于用户在编程时请求操作系统提供的服务，如申请和释放内存、打开和关闭文件等。系统调用命令是为了扩充及其指令，增强系统功能，方便用户使用而提供的。因此，在一些计算机系统中，把系统调用命令称为广义指令或访管指令。实际上不仅用户程序要使用系统调用命令，而且系统程序也要使用系统调用来实现其功能。不同的操作系统，其所提供的系统调用命令条数、格式及所执行的功能都不尽相同，它是用户在编程时获得操作系统服务的唯一途径。\r\n\r\n　　(3)图形接口\r\n\r\n　　图形接口通过图形化的界面以更加友好的方式向用户提供服务。', '/Uploads/Home/20131204/529e83ff44ca7.jpg', '操作系统 ', '灰色L', 1, 0, 0, 0, 1, NULL),
(118, 53, 3, 'guoxuenan', NULL, '', 'guoxuenan', '/Uploads/Home/20131208/52a3de91728ef.jpg', 'guo xue nan', '管理员', 1, 0, 0, 1, 0, NULL),
(117, 53, 2, '划分给合肥', NULL, '', '风格的股份高', '', '韩国发出', '管理员', 1, 0, 0, 0, 0, NULL),
(72, 1, 3, '我是影迷', NULL, '', 'asdfasdfsa', '/Uploads/Home/20130821/5213a5bb8c9e3.jpg', '你好', '灰色L', 1, 1, 0, 0, 0, NULL),
(83, 1, 3, 'wo shi guoxuenann', NULL, '', 'sdzhonghuajkirenjisuanjikexueyujishu ', '/Uploads/Home/20131204/529e800af12dc.jpg', 'hahh', '灰色L', 1, 1, 0, 0, 0, NULL),
(121, 53, 3, '啊啊啊', NULL, '', 'Class ExtendAction extends Action{\r\n   Public function _initialize(){\r\n   // 初始化的时候检查用户权限\r\n   $this->checkRbac();\r\n}\r\n \r\n    ', '/Uploads/Home/20131208/52a422128016b.jpg', '啊啊啊啊', '管理员', 1, 0, 0, 0, 0, NULL),
(111, 53, 3, '啊', NULL, '', '计算机', '/Uploads/Home/20131206/52a107e1827f8.jpg', '啊', '管理员', 1, 0, 0, 0, 0, NULL),
(112, 0, 3, '啊', NULL, '', '是啊是啊', '/Uploads/Home/20131206/52a10a2b6802f.jpg', '啊', '管理员', 1, 0, 0, 0, 0, NULL),
(113, 0, 1, '张院长走进', NULL, '', '张宏莉院长', '/Uploads/Home/20131206/52a10a5e4707c.jpg', '1103105', '管理员', 1, 0, 0, 0, 0, NULL),
(114, 0, 1, '啊', NULL, '', '1234567890', '/Uploads/Home/20131206/52a10aba0d3ad.jpg', '啊', '管理员', 1, 0, 0, 0, 0, NULL),
(115, 53, 1, '啊', NULL, '', '好的额', '/Uploads/Home/20131207/52a2c73b0f6e8.jpg', '啊', '管理员', 1, 0, 0, 0, 0, NULL),
(119, 55, 3, 'sda', NULL, '', 'sdads', '/Uploads/Home/20131208/52a3e1243571d.jpg', 'dasds', '管理员', 1, 0, 0, 0, 0, NULL),
(120, 53, 3, '王忠杰老师走进小班1103105', NULL, '', '萨达发生', '/Uploads/Home/20131208/52a3fb9b8df3e.jpg', '王忠杰  1103105', '管理员', 1, 0, 0, 0, 0, NULL),
(110, 53, 3, '啊', NULL, '', '名师小班行活动简介\r\n存储器管理和常见的分区算法分页存储分段存储段页式存储 1、逻辑地址和物理地址的概念 逻辑地址（Logical Address）是指由程式产生的和段相关的偏移地址部分。只有在Intel实模式下，逻辑地址才和物理地址相等（因为实模式没有分段或分页机制,Cpu不进行自动地址转换）； 物理地址（Physical Address）是指出现在CPU外部地址总线上的寻址物理内存的地址信号，是地址变换的最终结果地址。（假如启用了分页机制，那么线性地址会使用页目录和页表中的项变换成物理地址。假如没有启用分页机制，那么线性地址就直接成为物理地址了', '/Uploads/Home/20131206/52a104bf267bb.jpg', '啊', '管理员', 1, 0, 0, 1, 0, NULL),
(122, 57, 3, '“名师小班行” ', NULL, '', '“名师小班行”是计算机学院学工办在资深教授和本科生之间搭建的交流沟通的桥梁，已发展多年，得到学生们的好评。\r\n\r\n但是，目前的工作需要靠导员手工来做。你开发一个网站，减轻导员的负担，也便于在“名师”和“小班”之间建立更匹配的沟通关系：\r\n\r\n///导员：每学期开始时，规划本学期的“名师小班行”计划（频度、参与班级、具体时间////等）；向各位教授发出邀请；在收到教授的反馈后，将教授名单（姓名、可行时间、研究////方向）发布出去；\r\n\r\n–教授：在系统中响应邀请，同意或拒绝，从规划的各时间点中选定2-3个候选时间；\r\n\r\n–小班：提出感兴趣的问题；指定本班可行的时间点；\r\n', '/Uploads/Home/20131221/52b5b06c381d0.jpg', '名师小班行  王亚东', '管理员', 1, 0, 0, 0, 0, NULL),
(123, 57, 3, '名师小班行', NULL, '', '今天天气不错，我们出去压马路吧', '/Uploads/Home/20131222/52b64aae295bb.jpg', '王亚东', '管理员', 1, 0, 0, 0, 0, NULL),
(124, 57, 3, '呵呵呵呵', NULL, '', '今天天气不错，我们出去压马路吧', '/Uploads/Home/20131222/52b64b0128906.jpg', '压马路', '管理员', 1, 0, 0, 0, 0, NULL),
(125, 57, 3, '宿舍', NULL, '', '啊啊', '/Uploads/Home/20131222/52b68f37c5efa.jpg', '人', '管理员', 1, 0, 0, 0, 0, NULL),
(126, 58, 2, '', NULL, '', '', '', '', '管理员', 1, 0, 0, 0, 0, NULL),
(127, 57, 3, '王宇颖', NULL, '', ' <!--    <div class="col2"> -->\r\n\r\n    <!--登陆 start-->\r\n <!--    <{include file= "../Login/index.html"}> -->\r\n    <!--登陆 end-->\r\n\r\n    <!--右侧 start-->\r\n  <!--   <{include file= "../Public/right.html"}> -->\r\n    <!--右侧 start-->\r\n  <!--   </div> -->\r\n', '/Uploads/Home/20131222/52b69e26a3844.jpg', '王宇颖', '管理员', 1, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cs_files`
--

CREATE TABLE IF NOT EXISTS `cs_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 自增',
  `nid` int(11) DEFAULT '0' COMMENT '为0时是垃圾图片，上传成功时图片有效',
  `filename` varchar(100) NOT NULL COMMENT '上传附件的文件名',
  `title` varchar(100) DEFAULT NULL,
  `size` int(11) NOT NULL,
  `suffix` varchar(10) NOT NULL COMMENT '后缀名，用来显示不同图标',
  `dir` varchar(100) NOT NULL COMMENT '文件保存目录',
  `addtime` int(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- 转存表中的数据 `cs_files`
--

INSERT INTO `cs_files` (`id`, `nid`, `filename`, `title`, `size`, `suffix`, `dir`, `addtime`) VALUES
(1, 0, '520c2c4471469.jpg', NULL, 95971, 'jpg', 'Uploads/user/520c2c4471469.jpg', 1376529476),
(2, 0, '520c2c7f9f552.jpg', NULL, 86329, 'jpg', 'Uploads/user/520c2c7f9f552.jpg', 1376529535),
(3, 0, '520c2db8d6435.jpg', NULL, 95971, 'jpg', 'Uploads/user/520c2db8d6435.jpg', 1376529848),
(4, 0, '520c88628e56b.jpg', NULL, 86329, 'jpg', 'Uploads/user/520c88628e56b.jpg', 1376553058),
(5, 0, '520ca20240725.jpg', NULL, 95971, 'jpg', 'Uploads/user/520ca20240725.jpg', 1376559618),
(6, 0, '520cbdef6d6af.jpg', NULL, 95971, 'jpg', 'Uploads/user/520cbdef6d6af.jpg', 1376566767),
(7, 0, '520d2018352d2.jpg', NULL, 95971, 'jpg', 'Uploads/user/520d2018352d2.jpg', 1376591896),
(8, 0, '520d3059cf9db.jpg', NULL, 95971, 'jpg', 'Uploads/user/520d3059cf9db.jpg', 1376596057),
(9, 0, '520da5cd03f7a.jpg', NULL, 95971, 'jpg', 'Uploads/user/520da5cd03f7a.jpg', 1376626125),
(29, 0, '52138b4831c9f.jpg', NULL, 97063, 'jpg', 'Uploads//52138b4831c9f.jpg', 1377012552),
(11, 0, '520da699bfc3d.jpg', NULL, 69899, 'jpg', 'Uploads/user/520da699bfc3d.jpg', 1376626329),
(14, 0, '520df0e3d5aa4.jpg', NULL, 69899, 'jpg', 'Uploads/user/520df0e3d5aa4.jpg', 1376645347),
(15, 0, '520e5c6348174.jpg', NULL, 86329, 'jpg', 'Uploads/user/520e5c6348174.jpg', 1376672867),
(16, 0, '520e6429adcae.jpg', NULL, 78155, 'jpg', 'Uploads/user/520e6429adcae.jpg', 1376674857),
(17, 0, '520e64d7a74f8.jpg', NULL, 95971, 'jpg', 'Uploads/user/520e64d7a74f8.jpg', 1376675031),
(18, 0, '52109e719dea4.gif', NULL, 20948, 'gif', './Uploads/Home/20130818/52109e719dea4.gif', 1376820849),
(19, 0, '5210bfb47206e.png', NULL, 1991220, 'png', 'Uploads/user/5210bfb47206e.png', 1376829364),
(20, 0, '5210fbeb4b4bb.jpg', NULL, 45055, 'jpg', './Uploads/Home/20130819/5210fbeb4b4bb.jpg', 1376844779),
(26, 0, '521330f5d26f3.jpg', NULL, 45055, 'jpg', './Uploads/Home/20130820/521330f5d26f3.jpg', 1376989429),
(27, 0, '521389e5e7baa.jpg', NULL, 29963, 'jpg', './Uploads/Home/20130820/521389e5e7baa.jpg', 1377012197),
(28, 0, '52138afa2752c.jpg', NULL, 168028, 'jpg', 'Uploads//52138afa2752c.jpg', 1377012474),
(30, 0, '52138b86ae0e7.jpg', NULL, 34536, 'jpg', 'Uploads//52138b86ae0e7.jpg', 1377012614),
(31, 0, '52138ba9c2f87.jpg', NULL, 87149, 'jpg', 'Uploads//52138ba9c2f87.jpg', 1377012649),
(32, 0, '52138bba94497.jpg', NULL, 412628, 'jpg', 'Uploads//52138bba94497.jpg', 1377012666),
(33, 0, '52138be081de3.jpg', NULL, 172111, 'jpg', 'Uploads//52138be081de3.jpg', 1377012704),
(34, 0, '52138c78b2f30.jpg', NULL, 97063, 'jpg', 'Uploads//52138c78b2f30.jpg', 1377012856),
(35, 0, '52138cad10fd3.jpg', NULL, 135159, 'jpg', 'Uploads//52138cad10fd3.jpg', 1377012909),
(36, 0, '52138cf4450b2.jpg', NULL, 104565, 'jpg', 'Uploads//52138cf4450b2.jpg', 1377012980),
(37, 0, '521452be75d56.jpg', NULL, 88671, 'jpg', 'Uploads//521452be75d56.jpg', 1377063614),
(38, 0, '521453f2926b0.jpg', NULL, 144497, 'jpg', './Uploads/Home/20130821/521453f2926b0.jpg', 1377063922),
(39, 0, '521456875f3e0.jpg', NULL, 281282, 'jpg', './Uploads/Home/20130821/521456875f3e0.jpg', 1377064583),
(40, 0, '52145757bfd85.jpg', NULL, 160960, 'jpg', 'Uploads//52145757bfd85.jpg', 1377064791),
(41, 0, '5214587c1d2af.jpg', NULL, 193598, 'jpg', './Uploads/Home/20130821/5214587c1d2af.jpg', 1377065084),
(42, 0, '529e800af12dc.jpg', NULL, 47406, 'jpg', './Uploads/Home/20131204/529e800af12dc.jpg', 1386119179),
(43, 0, '529e83ff44ca7.jpg', NULL, 335801, 'jpg', './Uploads/Home/20131204/529e83ff44ca7.jpg', 1386120191),
(44, 0, '529ec56154fe2.jpg', NULL, 636534, 'jpg', './Uploads/Home/20131204/529ec56154fe2.jpg', 1386136929),
(45, 0, '529ec58d0c5c6.jpg', NULL, 636534, 'jpg', './Uploads/Home/20131204/529ec58d0c5c6.jpg', 1386136973),
(46, 0, '529ec5973c5ad.jpg', NULL, 636534, 'jpg', './Uploads/Home/20131204/529ec5973c5ad.jpg', 1386136983),
(47, 0, '529ed25fb771d.jpg', NULL, 103441, 'jpg', './Uploads/Home/20131204/529ed25fb771d.jpg', 1386140255),
(48, 0, '529f2e5cbccc4.jpg', NULL, 73543, 'jpg', './Uploads/Home/20131204/529f2e5cbccc4.jpg', 1386163804),
(49, 0, '529f2e8545bc2.jpg', NULL, 47406, 'jpg', './Uploads/Home/20131204/529f2e8545bc2.jpg', 1386163845),
(50, 0, '529f2eba0a2b3.jpg', NULL, 286505, 'jpg', './Uploads/Home/20131204/529f2eba0a2b3.jpg', 1386163898),
(51, 0, '529f332dd0755.jpg', NULL, 51091, 'jpg', './Uploads/Home/20131204/529f332dd0755.jpg', 1386165037),
(52, 0, '529f338602a87.jpg', NULL, 103441, 'jpg', './Uploads/Home/20131204/529f338602a87.jpg', 1386165126),
(53, 0, '529fd8ff13083.jpg', NULL, 47406, 'jpg', './Uploads/Home/20131205/529fd8ff13083.jpg', 1386207487),
(54, 0, '529fd90b6674c.jpg', NULL, 70008, 'jpg', './Uploads/Home/20131205/529fd90b6674c.jpg', 1386207499),
(55, 0, '529fda927eb76.JPG', NULL, 1878570, 'JPG', './Uploads/Home/20131205/529fda927eb76.JPG', 1386207890),
(56, 0, '529fdac63b52d.jpg', NULL, 47406, 'jpg', './Uploads/Home/20131205/529fdac63b52d.jpg', 1386207942),
(57, 0, '52a0779c08a61.jpg', NULL, 70008, 'jpg', './Uploads/Home/20131205/52a0779c08a61.jpg', 1386248092),
(58, 0, '52a104bf267bb.jpg', NULL, 68496, 'jpg', './Uploads/Home/20131206/52a104bf267bb.jpg', 1386284223),
(59, 0, '52a107e1827f8.jpg', NULL, 46010, 'jpg', './Uploads/Home/20131206/52a107e1827f8.jpg', 1386285025),
(60, 0, '52a10a2b6802f.jpg', NULL, 70008, 'jpg', './Uploads/Home/20131206/52a10a2b6802f.jpg', 1386285611),
(61, 0, '52a10a5e4707c.jpg', NULL, 103441, 'jpg', './Uploads/Home/20131206/52a10a5e4707c.jpg', 1386285662),
(62, 0, '52a10aba0d3ad.jpg', NULL, 77729, 'jpg', './Uploads/Home/20131206/52a10aba0d3ad.jpg', 1386285754),
(63, 0, '52a10bd478b07.jpg', NULL, 68496, 'jpg', './Uploads/Home/20131206/52a10bd478b07.jpg', 1386286036),
(64, 0, '52a10caab29cd.jpg', NULL, 12547, 'jpg', './Uploads/Home/20131206/52a10caab29cd.jpg', 1386286250),
(65, 0, '52a10db3c2086.jpg', NULL, 47406, 'jpg', './Uploads/Home/20131206/52a10db3c2086.jpg', 1386286515),
(66, 0, '52a10e2b549e4.jpg', NULL, 47406, 'jpg', './Uploads/Home/20131206/52a10e2b549e4.jpg', 1386286635),
(67, 0, '52a11112c9ef0.jpg', NULL, 77729, 'jpg', './Uploads/Home/20131206/52a11112c9ef0.jpg', 1386287378),
(68, 0, '52a11133c311e.jpg', NULL, 77729, 'jpg', './Uploads/Home/20131206/52a11133c311e.jpg', 1386287411),
(69, 0, '52a111375c563.jpg', NULL, 77729, 'jpg', './Uploads/Home/20131206/52a111375c563.jpg', 1386287415),
(70, 0, '52a11278b29c7.jpg', NULL, 96176, 'jpg', './Uploads/Home/20131206/52a11278b29c7.jpg', 1386287736),
(71, 0, '52a2c73b0f6e8.jpg', NULL, 12547, 'jpg', './Uploads/Home/20131207/52a2c73b0f6e8.jpg', 1386399547),
(72, 0, '52a2e01bbb20d.jpg', NULL, 151720, 'jpg', './Uploads/Home/20131207/52a2e01bbb20d.jpg', 1386405915),
(73, 0, '52a2e64aa410e.jpg', NULL, 103441, 'jpg', './Uploads/Home/20131207/52a2e64aa410e.jpg', 1386407498),
(74, 0, '52a2e67dc772b.jpg', NULL, 574142, 'jpg', './Uploads/Home/20131207/52a2e67dc772b.jpg', 1386407549),
(75, 0, '52a2edf7a9887.jpg', NULL, 81735, 'jpg', './Uploads/Home/20131207/52a2edf7a9887.jpg', 1386409463),
(76, 0, '52a3ba610302e.jpg', NULL, 77729, 'jpg', './Uploads/Home/20131208/52a3ba610302e.jpg', 1386461793),
(77, 0, '52a3de91728ef.jpg', NULL, 68496, 'jpg', './Uploads/Home/20131208/52a3de91728ef.jpg', 1386471057),
(78, 0, '52a3e0d6ef223.jpg', NULL, 77729, 'jpg', './Uploads/Home/20131208/52a3e0d6ef223.jpg', 1386471639),
(79, 0, '52a3e1243571d.jpg', NULL, 103441, 'jpg', './Uploads/Home/20131208/52a3e1243571d.jpg', 1386471716),
(80, 0, '52a3fb9b8df3e.jpg', NULL, 87136, 'jpg', './Uploads/Home/20131208/52a3fb9b8df3e.jpg', 1386478491),
(81, 0, '52a422128016b.jpg', NULL, 147441, 'jpg', './Uploads/Home/20131208/52a422128016b.jpg', 1386488338),
(82, 0, '52b40b1cd2418.jpg', NULL, 780831, 'jpg', './Uploads/Home/20131220/52b40b1cd2418.jpg', 1387531037),
(83, 0, '52b41bbf3b06d.jpg', NULL, 780831, 'jpg', './Uploads/Home/20131220/52b41bbf3b06d.jpg', 1387535296),
(84, 0, '52b5232c7a707.jpg', NULL, 12739, 'jpg', './Uploads/Home/20131221/52b5232c7a707.jpg', 1387602733),
(85, 0, '52b527450ffcd.gif', NULL, 5420, 'gif', './Uploads/Home/20131221/52b527450ffcd.gif', 1387603782),
(86, 0, '52b5299606b09.png', NULL, 16264, 'png', './Uploads/Home/20131221/52b5299606b09.png', 1387604375),
(87, 0, '52b52a951c8ff.gif', NULL, 5420, 'gif', './Uploads/Home/20131221/52b52a951c8ff.gif', 1387604630),
(88, 0, '52b52b254d737.gif', NULL, 5420, 'gif', './Uploads/Home/20131221/52b52b254d737.gif', 1387604774),
(89, 0, '52b5a5dcc0c55.jpg', NULL, 636534, 'jpg', './Uploads/Home/20131221/52b5a5dcc0c55.jpg', 1387636188),
(90, 0, '52b5b06c381d0.jpg', NULL, 147441, 'jpg', './Uploads/Home/20131221/52b5b06c381d0.jpg', 1387638892),
(91, 0, '52b5b1ad1f8ab.JPG', NULL, 1878570, 'JPG', './Uploads/Home/20131221/52b5b1ad1f8ab.JPG', 1387639213),
(92, 0, '52b62ce61419a.JPG', NULL, 1878570, 'JPG', './Uploads/Home/20131222/52b62ce61419a.JPG', 1387670758),
(93, 0, '52b62d17d7602.jpg', NULL, 636534, 'jpg', './Uploads/Home/20131222/52b62d17d7602.jpg', 1387670807),
(94, 0, '52b62d3b4f655.jpg', NULL, 70008, 'jpg', './Uploads/Home/20131222/52b62d3b4f655.jpg', 1387670843),
(95, 0, '52b62d6c02ed6.jpg', NULL, 335801, 'jpg', './Uploads/Home/20131222/52b62d6c02ed6.jpg', 1387670892),
(96, 0, '52b64aae295bb.jpg', NULL, 47406, 'jpg', './Uploads/Home/20131222/52b64aae295bb.jpg', 1387678382),
(97, 0, '52b64b0128906.jpg', NULL, 70008, 'jpg', './Uploads/Home/20131222/52b64b0128906.jpg', 1387678465),
(98, 0, '52b66ce6bf861.jpg', NULL, 96176, 'jpg', './Uploads/Home/20131222/52b66ce6bf861.jpg', 1387687142),
(99, 0, '52b68f37c5efa.jpg', NULL, 103441, 'jpg', './Uploads/Home/20131222/52b68f37c5efa.jpg', 1387695927),
(100, 0, '52b693905701c.jpg', NULL, 114662, 'jpg', './Uploads/Home/20131222/52b693905701c.jpg', 1387697040),
(101, 0, '52b69982c344e.jpg', NULL, 34211, 'jpg', './Uploads/Home/20131222/52b69982c344e.jpg', 1387698562),
(102, 0, '52b69e26a3844.jpg', NULL, 34211, 'jpg', './Uploads/Home/20131222/52b69e26a3844.jpg', 1387699750);

-- --------------------------------------------------------

--
-- 表的结构 `cs_gbook`
--

CREATE TABLE IF NOT EXISTS `cs_gbook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键 自增',
  `uid` int(11) DEFAULT '0' COMMENT '0：游客留言',
  `name` varchar(100) NOT NULL COMMENT '留言姓名',
  `content` varchar(255) NOT NULL COMMENT '留言内容',
  `email` varchar(100) NOT NULL,
  `url` varchar(50) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `state` tinyint(4) DEFAULT '0',
  `addtime` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `cs_gbook`
--

INSERT INTO `cs_gbook` (`id`, `uid`, `name`, `content`, `email`, `url`, `ip`, `state`, `addtime`) VALUES
(6, 0, '阿萨1', '为全额', '513718409@qq.com', '513718409@qq.com', NULL, 1, '1375286405'),
(5, 0, '阿萨', '阿萨阿萨阿萨阿萨', '513718409@qq.com', '513718409@qq.com', NULL, 0, '1375547600'),
(7, 0, '阿萨2', '阿萨阿2萨阿萨阿萨', '513718409@qq.com', '513718409@qq.com', NULL, 0, NULL),
(8, 0, '阿3萨', '阿萨阿萨阿3萨阿萨', '513718409@qq.com', '513718409@qq.com', NULL, 1, NULL),
(9, 0, '阿4萨', '阿萨阿萨4阿萨阿萨', '513718409@qq.com', '513718409@qq.com', NULL, 0, NULL),
(10, 0, '阿萨5', '阿萨阿萨阿萨阿萨5', '513718409@qq.com', '513718409@qq.com', NULL, 0, NULL),
(11, 0, '阿萨6', '111111111', '513718409@qq.com', '513718409@qq.com', NULL, 0, NULL),
(18, 0, 'asdsad', 'asdasdasdasd', 'sadasd@qq.com', '', '127', 0, '1376836509'),
(14, 0, '阿萨9', 'eeee', '513718409@qq.com', '513718409@qq.com', NULL, 0, NULL),
(16, 0, 'asdasdsa', '', '', '', NULL, 0, NULL),
(17, 0, 'asdasdasd', 'asdasdasdasd', '513718409@qq.com', '', NULL, 0, NULL),
(19, 0, 'asdasdasd', 'sadsadasd', 'asdasdas@aa.com', '', '127.0.0.1', 0, '1376836653'),
(20, 0, 'asdasdasd', 'sdfsdfsdewwefe', '513718409@qq.com', '', '127.0.0.1', 0, '1376838481'),
(21, 0, 'asdasdasd', '房贷首付但是', '513718409@qq.com', 'dfsfdsfds', '127.0.0.1', 0, '1376838533'),
(22, 0, 'dasdsad', 'adasdasdasdasdasd', 'sadasdasd@qq.com', 'dasd', '127.0.0.1', 0, '1376838969'),
(23, 0, 'dsadasdasd', 'dasdasdasda', '513718409@qq.com', 'asdasdasd', '127.0.0.1', 0, '1376839179'),
(24, 0, 'asdasdasd', 'dsadasdsad', '513718409@qq.com', 'asdsadas', '127.0.0.1', 0, '1376839248'),
(25, 0, 'asdasdasd', 'asdasdasdadsad', '513718409@qq.com', 'asdsadas', '127.0.0.1', 0, '1376839350'),
(26, 0, 'asdasdasd', 'asdasdasd', '513718409@qq.com', 'asdsadas', '127.0.0.1', 0, '1376839397'),
(27, 0, 'asdasdasd', 'asdsadsadasd', '513718409@qq.com', 'asdsadas', '127.0.0.1', 0, '1376839540'),
(28, 0, 'sadasd', 'dasdasdasd', 'asdasdas@aa.com', 'asdsadas', '127.0.0.1', 0, '1376839570'),
(29, 0, 'asdasdasd', 'adasdsadasd', '513718409@qq.com', 'asdsadas', '127.0.0.1', 0, '1376841139'),
(30, 0, 'asdasdasd', 'rrrr', '513718409@qq.com', 'www.baidu.com', '127.0.0.1', 0, '1376916534'),
(31, 0, 'dasdsad', 'dasdsadas', 'admin@qq.com', 'sdasdas', '127.0.0.1', 1, '1376991391'),
(32, 0, '阿斯顿发生地方', '撒地方按时', '1334@11.com', '萨达发生', '127.0.0.1', 1, '1386046321'),
(33, 0, '郭雪楠', 'very good 1', '1134234@qq.com', 'www.proftoclass.com', '127.0.0.1', 0, '1387640443');

-- --------------------------------------------------------

--
-- 表的结构 `cs_lou`
--

CREATE TABLE IF NOT EXISTS `cs_lou` (
  `tid` int(11) NOT NULL,
  `num` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_lou`
--

INSERT INTO `cs_lou` (`tid`, `num`) VALUES
(43, 5),
(41, 5),
(36, 7),
(37, 5),
(38, 11),
(39, 26),
(44, 19),
(46, 12),
(45, 2),
(40, 4),
(54, 2),
(56, 2),
(26, 2),
(30, 1),
(31, 1),
(106, 1),
(104, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cs_message`
--

CREATE TABLE IF NOT EXISTS `cs_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '小纸条id',
  `uid` int(11) NOT NULL COMMENT '发信用户id',
  `mid` int(11) NOT NULL COMMENT '收信用户id',
  `read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：未读  1：已读',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '判读是否发送成功 1:发送成功',
  `content` varchar(200) NOT NULL COMMENT '发送内容',
  `addtime` varchar(64) DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `cs_message`
--

INSERT INTO `cs_message` (`id`, `uid`, `mid`, `read`, `status`, `content`, `addtime`) VALUES
(4, 1, 33, 0, 1, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cs_relagn`
--

CREATE TABLE IF NOT EXISTS `cs_relagn` (
  `gid` tinyint(4) DEFAULT NULL COMMENT '用户组的id',
  `nid` tinyint(4) DEFAULT NULL COMMENT '节点的id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_relagn`
--

INSERT INTO `cs_relagn` (`gid`, `nid`) VALUES
(1, 2),
(1, 55),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 59),
(2, 1),
(1, 58),
(1, 57),
(1, 56),
(1, 54),
(1, 53),
(1, 52),
(1, 51),
(1, 50),
(1, 49),
(1, 48),
(1, 47),
(1, 46),
(1, 45),
(1, 44),
(1, 43),
(1, 42),
(1, 41),
(1, 40),
(1, 39),
(1, 38),
(1, 37),
(1, 36),
(1, 35),
(1, 34),
(2, 2),
(2, 3),
(1, 33),
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cs_tags`
--

CREATE TABLE IF NOT EXISTS `cs_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 自增',
  `title` varchar(100) NOT NULL COMMENT '标签标题',
  `color` varchar(100) DEFAULT NULL COMMENT '标签颜色',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=175 ;

--
-- 转存表中的数据 `cs_tags`
--

INSERT INTO `cs_tags` (`id`, `title`, `color`) VALUES
(142, '操作系统', NULL),
(174, '王宇颖', NULL),
(173, '人', NULL),
(172, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cs_teacherdb`
--

CREATE TABLE IF NOT EXISTS `cs_teacherdb` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '1',
  `cid` int(11) NOT NULL,
  `teachername` varchar(200) NOT NULL COMMENT '教师姓名',
  `content` text NOT NULL COMMENT '文章内容',
  `pic` varchar(100) NOT NULL,
  `up` int(11) DEFAULT '0',
  `down` int(11) DEFAULT '0',
  `addtime` varchar(64) DEFAULT NULL,
  `tim2` date DEFAULT NULL,
  `tim3` date DEFAULT NULL,
  `tim1` date DEFAULT NULL,
  `times` int(5) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=136 ;

--
-- 转存表中的数据 `cs_teacherdb`
--

INSERT INTO `cs_teacherdb` (`id`, `uid`, `cid`, `teachername`, `content`, `pic`, `up`, `down`, `addtime`, `tim2`, `tim3`, `tim1`, `times`, `tid`) VALUES
(135, 53, 3, '王宇颖', '王宇颖，教授，计算机语言基础教研室主任，1998年被评为哈工大计算机基础教学带头人，2000-2005年被国家教育部聘任为全国高校计算机专业教学指导委员会计算机分委会委员。2006年荣获IBM中国优秀教师奖，2008年获校、省级教学名师奖，2009年获宝钢优秀教师特等奖提名奖 奖。 主要研究方向：软件工程，面向对象技术。几年来，完成国家自然科学基金、国防基金、国防科研等项目。其科研成果获部级科技进步一等奖、二等奖和三等奖各1项...\r\n网站管理员 - 05/22/2011 - 10:18', '/Uploads/Home/20131222/52b69982c344e.jpg', 0, 0, '2013-12-22', NULL, NULL, NULL, 0, 0),
(2, 53, 3, '王亚东', '生物信息 计算机', '/Uploads/Home/20131222/52b62d17d7602.jpg', 0, 0, '2013-12-22', NULL, NULL, NULL, 0, 0),
(3, 53, 3, '张晓明', '计算机学院11级', '/Uploads/Home/20131222/52b62d3b4f655.jpg', 0, 0, '2013-12-22', '2013-12-18', '2013-12-26', '2013-12-01', 0, 0),
(4, 53, 3, '刘秋如', '计算机学院11级 5班的', '/Uploads/Home/20131222/52b62d6c02ed6.jpg', 0, 0, '2013-12-22', '2014-01-10', NULL, '2014-01-10', 3, 65),
(133, 53, 3, '王老师', '研究很多东西', '/Uploads/Home/20131222/52b66ce6bf861.jpg', 0, 0, '2013-12-22', '2013-12-28', '2013-12-29', '2013-12-27', 3, 75),
(134, 76, 3, '唐朔飞', '请填写名师研究方向11111等和名师简介', '/Uploads/Home/20131222/52b693905701c.jpg', 0, 0, '2013-12-22', NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cs_time`
--

CREATE TABLE IF NOT EXISTS `cs_time` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `times` int(5) unsigned NOT NULL DEFAULT '0',
  `grade` int(10) unsigned NOT NULL,
  `time1start` date DEFAULT NULL,
  `time1end` date DEFAULT NULL,
  `time2start` date DEFAULT NULL,
  `time2end` date DEFAULT NULL,
  `time3start` date DEFAULT NULL,
  `time3end` date DEFAULT NULL,
  `time4start` date DEFAULT NULL,
  `time4end` date DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `cs_time`
--

INSERT INTO `cs_time` (`id`, `times`, `grade`, `time1start`, `time1end`, `time2start`, `time2end`, `time3start`, `time3end`, `time4start`, `time4end`, `content`) VALUES
(2, 2, 11, '2013-12-03', '2013-12-18', '2013-12-09', '2013-12-18', NULL, NULL, NULL, NULL, '本学期推荐的老师有 王忠杰、王宇颖、王亚东、王．．．．'),
(4, 3, 12, '2013-12-02', '2013-12-19', '2013-12-19', '2013-12-26', '2013-12-24', '2013-12-26', NULL, NULL, '明辉');

-- --------------------------------------------------------

--
-- 表的结构 `cs_user`
--

CREATE TABLE IF NOT EXISTS `cs_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 自增',
  `gid` int(11) NOT NULL DEFAULT '1' COMMENT '用户组id',
  `username` varchar(200) NOT NULL COMMENT '用户登陆账号',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  `name` varchar(64) NOT NULL COMMENT '用户姓名',
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `age` varchar(100) NOT NULL DEFAULT '|2013|08|31',
  `desc` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
  `skin` varchar(100) DEFAULT 'aa.jpg' COMMENT '用户头像',
  `pic` varchar(100) DEFAULT '/Public/Home/images/jiong.png' COMMENT '默认黑鸭子',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：正常',
  `addtime` varchar(64) DEFAULT NULL COMMENT '用户注册时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=77 ;

--
-- 转存表中的数据 `cs_user`
--

INSERT INTO `cs_user` (`id`, `gid`, `username`, `password`, `name`, `sex`, `age`, `desc`, `email`, `skin`, `pic`, `state`, `addtime`) VALUES
(53, 2, '啊', '4124bc0a9335c27f086f24ba207a4912', '我', 1, '|1910|08|31', '按时', '啊啊@31234.com', 'aa.jpg', '/Uploads/Home/20131205/529fda927eb76.JPG', 0, '2013-12-02'),
(57, 1, '1103105', '4124bc0a9335c27f086f24ba207a4912', 'O(∩_∩)O~', 1, '|1914|5|28', 'hello world~', '1103105@qq.com', 'aa.jpg', '/Uploads/Home/20131220/52b41bbf3b06d.jpg', 0, '2013-12-02'),
(58, 1, '1203105', '4124bc0a9335c27f086f24ba207a4912', '呵呵', 1, '|2013|08|31', '', 'hit@123.com', 'aa.jpg', '/Public/Home/images/jiong.png', 0, '1387589705'),
(64, 2, '张晓明', 'aa', '张晓明', 1, '|2013|08|31', NULL, 'zhangxiaoming@hit.edu.cn', 'aa.jpg', '/Public/Home/images/jiong.png', 0, '2013-12-22'),
(65, 2, '刘秋如', '4124bc0a9335c27f086f24ba207a4912', '刘秋如', 1, '|2013|08|31', NULL, 'qiuru@qq.com', 'aa.jpg', '/Public/Home/images/jiong.png', 0, '2013-12-22'),
(62, 2, '郭雪楠', '4124bc0a9335c27f086f24ba207a4912', '郭雪楠', 1, '|2013|08|31', '', 'guo@163.com', 'aa.jpg', '/Public/Home/images/jiong.png', 0, '2013-12-22'),
(66, 1, '1303105', '4124bc0a9335c27f086f24ba207a4912', '呵呵', 1, '|2013|08|31', '', 'shit@hit.edu.cn', 'aa.jpg', '/Public/Home/images/jiong.png', 0, '2013-12-22'),
(68, 1, '1403105', '4124bc0a9335c27f086f24ba207a4912', '', 1, '|2013|08|31', NULL, 'a@hit.edu.cn', 'aa.jpg', '/Public/Home/images/jiong.png', 0, '2013-12-22'),
(75, 1, '王老师', 'aa', '王老师', 1, '|2013|08|31', '', '124@hit.edu.cn', 'aa.jpg', '/Public/Home/images/jiong.png', 0, '2013-12-22'),
(76, 1, '11', 'aa', '唐朔飞', 1, '|2013|08|31', '', '1@133.com', 'aa.jpg', '/Public/Home/images/jiong.png', 0, '2013-12-22');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
