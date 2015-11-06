-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2015 at 03:44 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourist`
--
CREATE DATABASE IF NOT EXISTS `tourist` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tourist`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CategoryId` int(11) NOT NULL,
  `CategoryName` text
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryId`, `CategoryName`) VALUES
(1, 'Tour'),
(2, 'Place'),
(3, 'Feeling');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `CommentId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `CommentContent` text,
  `DateComment` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `LocationId` int(11) NOT NULL,
  `Name` text,
  `Description` text
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LocationId`, `Name`, `Description`) VALUES
(1, 'Quảng Bình', 'Tỉnh'),
(2, 'Hà Nội', 'Thành Phố'),
(3, 'Đà Lạt', 'Thành Phố'),
(4, 'Đà Năng', 'Thành Phố'),
(5, 'Huế', 'Thành Phố'),
(6, 'Quảng Ngãi', 'Tỉnh'),
(7, 'Vũng Tàu', 'Thành Phố'),
(8, 'Hồ Chí Minh', 'Thành Phố'),
(9, 'Kon Tum', 'Tỉnh'),
(10, 'Bình Định', 'Tỉnh'),
(11, 'Long An', 'Tỉnh'),
(12, 'Quảng Trị', 'Thành Phố'),
(13, 'Kon Tum', 'Thành Phố'),
(14, 'Lào Cai', 'Thành Phố'),
(15, 'Lạng Sơn', 'Thành Phố'),
(16, 'Đắk Lắk', 'Tỉnh'),
(17, 'Cà Mau', 'Thành Phố'),
(18, 'Móng Cái', 'Thành Phố'),
(19, 'Bắc Ninh', 'Tỉnh'),
(20, 'Tuyên Quang', 'Tỉnh');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `PostId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  `Title` text,
  `Content` text,
  `Date` datetime DEFAULT NULL,
  `Price` text,
  `Views` int(11) DEFAULT NULL,
  `Buys` int(11) NOT NULL,
  `NumberPerson` int(11) NOT NULL,
  `TotalTime` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`PostId`, `CategoryId`, `LocationId`, `UserId`, `Title`, `Content`, `Date`, `Price`, `Views`, `Buys`, `NumberPerson`, `TotalTime`) VALUES
(2, 2, NULL, 1, 'Khu du lịch Dĩ An', '<p>D&ugrave; kh&ocirc;ng trực tiếp thực hiện h&agrave;nh vi giết 6 người gia đ&igrave;nh đại gia ng&agrave;nh gỗ L&ecirc; Văn Mỹ nhưng Trần Đ&igrave;nh Thoại (27 tuổi, qu&ecirc; Vĩnh Long) vừa bị VKS tỉnh B&igrave;nh Phước truy tố hai tội danh Giết người v&agrave; Cướp t&agrave;i sản trong vai tr&ograve; đồng phạm với chủ mưu Nguyễn Hải Dương (24 tuổi, qu&ecirc; An Giang).&nbsp;Trước khi c&ugrave;ng Vũ Văn Tiến g&acirc;y thảm s&aacute;t, Dương đ&atilde; được Thoại đồng &yacute; gi&uacute;p sức nhưng v&igrave; qu&aacute; sợ, anh ta đ&atilde; bỏ cuộc v&agrave;o ph&uacute;t ch&oacute;t.</p>\n\n<p>Theo điều tra, sau khi l&ecirc;n kế hoạch v&agrave; thị s&aacute;t th&agrave;nh c&ocirc;ng, trưa 4/7, Dương hẹn Thoại gặp mặt. &quot;Anh gi&uacute;p em chuyện n&agrave;y được kh&ocirc;ng. Em l&agrave;m ăn, h&ugrave;n tiền mua gỗ cao su chừng 800 triệu đồng nhưng người đ&oacute; b&aacute;n gỗ m&agrave; kh&ocirc;ng chịu trả, giờ l&ecirc;n cướp lại&quot;, Dương mở lời với Thoại tại qu&aacute;n c&agrave; ph&ecirc;. Thoại thắc mắc: &quot;Người ta nợ tiền th&igrave; l&ecirc;n đ&ograve;i chứ sao phải cướp&quot;. Dương liền bịa: &quot;Em l&agrave;m ăn kh&ocirc;ng c&oacute; giấy tờ, đ&ograve;i người đ&oacute; kh&ocirc;ng trả&quot;.</p>\n\n<table align="center" border="0" cellpadding="3" cellspacing="0" style="width:89.2857%">\n	<tbody>\n		<tr>\n			<td><img alt="Trần Đình Thoại bị bắt sau một tháng vụ án mạng xảy ra. Ảnh: Khánh Vinh" src="http://m.f29.img.vnecdn.net/2015/11/03/tham-sat-ok-2-1792-1439868836-2381-2378-1446562518.jpg" /></td>\n		</tr>\n		<tr>\n			<td>\n			<p>Trần Đ&igrave;nh Thoại bị bắt sau một th&aacute;ng vụ &aacute;n mạng xảy ra. Ảnh: <em>Kh&aacute;nh Vinh</em></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Khi Thoại hỏi kỹ hơn: &quot;Biết nh&agrave; c&oacute; tiền kh&ocirc;ng m&agrave; cướp&quot;, Dương trả lời: &quot;Em nghe n&oacute;i họ mới b&aacute;n cao su, c&oacute; mấy tỷ g&igrave; đ&oacute;. Anh gi&uacute;p em cướp lại đi, em lấy đủ số tiền của em th&ocirc;i, c&ograve;n bao nhi&ecirc;u đưa anh hết. Em l&ecirc;n kế hoạch hết rồi, l&uacute;c trước em l&ecirc;n nh&agrave; đ&oacute; chơi, giờ em c&ograve;n li&ecirc;n lạc với thằng con của ổng&nbsp;(tức Dư Minh Vỹ, ch&aacute;u nhưng thường gọi &ocirc;ng Mỹ l&agrave; cha). Khi m&igrave;nh l&ecirc;n đến đ&oacute; điện thằng nh&oacute;c ra mở cửa rồi xử thằng nh&oacute;c lu&ocirc;n&quot;.&nbsp;Thoại n&oacute;i: &quot;Sao phải xử thằng nh&oacute;c&quot;. Dương l&yacute; giải: &quot;Xử thằng nh&oacute;c m&igrave;nh mới v&agrave;o nh&agrave; được. M&igrave;nh v&agrave;o nh&agrave; bằng đường thằng nh&oacute;c đi ra&quot;.</p>\n\n<p>Chiều c&ugrave;ng ng&agrave;y, Thoại hỏi Dương: &quot;Chuẩn bị g&igrave; chưa?&quot;. Dương n&oacute;i: &quot;Em c&oacute; c&acirc;y s&uacute;ng điện v&agrave; một con dao bấm&quot;. Khi nghe Dương cho biết sẽ giết hết 6 người trong gia đ&igrave;nh &ocirc;ng Mỹ, Thoại cắt ngang: &quot;Cướp được tiền th&igrave; sao phải giết?&quot; nhưng Dương ph&acirc;n trần: &quot;Phải giết hết. Kh&ocirc;ng giết sẽ bị lộ v&igrave; mấy người đ&oacute; biết mặt em hết rồi&quot;.&nbsp;Nghe Thoại bảo &quot;th&ugrave; tức ai th&igrave; giết người đ&oacute;&quot;, Dương n&oacute;i: &quot;Phải giết hết. Anh kh&ocirc;ng giết, để em giết&quot;.</p>\n\n<p>Khoảng 23h h&ocirc;m đ&oacute;, cả hai l&ecirc;n đường đi B&igrave;nh Phước theo kế hoạch. Gần đến nh&agrave; &ocirc;ng Mỹ, Thoại hỏi: &quot;C&oacute; c&aacute;ch n&agrave;o cướp m&agrave; kh&ocirc;ng giết người được kh&ocirc;ng?&quot;. Kẻ chủ mưu liền ph&acirc;n bua: &quot;Phải giết thằng nhỏ để v&agrave;o nh&agrave;. Khi v&agrave;o nh&agrave; th&igrave; phải giết mấy người kia v&igrave; họ c&oacute; thể biết mặt em&quot;.</p>\n\n<p>Thoại lo sợ: &quot;V&agrave;o lỡ bị ph&aacute;t hiện th&igrave; sao?&quot;. Dương trấn an: &quot;Anh y&ecirc;n t&acirc;m. Em c&oacute; kế hoạch hết rồi, kh&ocirc;ng bị ph&aacute;t hiện đ&acirc;u. Lỡ bị ph&aacute;t hiện th&igrave; xử lu&ocirc;n&quot;. Thoại lại hỏi: &quot;Nh&agrave; c&oacute; mấy người?&quot;. Dương đ&aacute;p: &quot;6 người, c&oacute; một đứa b&eacute; 2 tuổi&quot;.</p>\n\n<p>Đến nh&agrave; &ocirc;ng Mỹ, Dương gọi điện thoại nhiều lần nhưng Vỹ kh&ocirc;ng mở cửa. Thấy vậy Thoại liền hối Dương về, mai l&ecirc;n lại. Tr&ecirc;n đường về TP HCM, Thoại đề xuất mua th&ecirc;m con dao để h&ocirc;m sau đi tiếp v&agrave; Dương gật đầu: &quot;Ừ, vậy ng&agrave;y mai anh mua rồi đem v&ocirc; đi lu&ocirc;n&quot;.&nbsp;Thoại chạy xe m&agrave; Dương mượn của d&igrave; về nh&agrave; lu&ocirc;n.</p>\n\n<p>S&aacute;ng 5/7, Dương đến xưởng gỗ gặp Tiến n&ecirc;n rủ đi uống c&agrave; ph&ecirc; v&agrave; gọi điện cho Thoại nhưng bị can n&agrave;y b&aacute;o bận kh&ocirc;ng đến. Đến 19h, đang ngồi c&agrave; ph&ecirc; với Tiến, Dương tiếp tục gọi điện cho Thoại ra uống nước với mục đ&iacute;ch đi đến nh&agrave; &ocirc;ng Mỹ lu&ocirc;n. &quot;Dương cứ uống nước xong rồi về, khuya sẽ đến đ&oacute;n đi lu&ocirc;n&quot;, Thoại đ&aacute;p lại.</p>\n\n<p>Chiều 5/7, Thoại chạy xe m&aacute;y m&agrave; Dương giao h&ocirc;m trước đến chợ Thạnh Xu&acirc;n, quận 12, TP HCM mua một con dao gi&aacute; 45.000 đồng, để dưới y&ecirc;n xe rồi đi chơi. Nhưng nhận thấy kế hoạch cướp t&agrave;i sản của Dương phải giết nhiều người n&ecirc;n Thoại kh&ocirc;ng muốn thực hiện.</p>\n\n<table align="center" border="0" cellpadding="3" cellspacing="0" style="width:100%">\n	<tbody>\n		<tr>\n			<td><img alt="Hai đêm trước xảy ra vụ thảm sát, bị can Thoại đã cùng Dương đến đứng trước cổng nhưng kế hoạch không thực hiện được do yếu tố khách quan. Ảnh: Phước Tuấn" src="http://m.f29.img.vnecdn.net/2015/11/03/tham-sat-8-ok-660x0-3088-1446562518.jpg" style="width:100%" /></td>\n		</tr>\n		<tr>\n			<td>\n			<p>Hai đ&ecirc;m trước xảy ra vụ thảm s&aacute;t, Thoại đ&atilde; c&ugrave;ng Dương đứng trước cổng căn biệt thự nh&agrave; &ocirc;ng Mỹ&nbsp;nhưng kế hoạch kh&ocirc;ng thực hiện được l&agrave;&nbsp;do yếu tố kh&aacute;ch quan. Ảnh: <em>Phước Tuấn</em></p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>22h30, Thoại c&ugrave;ng bạn g&aacute;i đem xe v&agrave; dao đến cho Dương. L&uacute;c gặp mặt, Thoại n&oacute;i: &quot;Con dao anh mua rồi, b&acirc;y giờ m&agrave;y giữ đi anh phải đi về qu&ecirc; rồi&quot;. Bị can n&agrave;y cho biết &quot;phải về qu&ecirc; gấp để gặp mặt b&agrave; ngoại&quot;. Kế hoạch đi c&ugrave;ng Thoại bị vỡ n&ecirc;n tối đ&oacute;, Dương về xưởng gỗ giấu dao rồi nhắn cho Vỹ bảo xe hỏng kh&ocirc;ng l&ecirc;n được.&nbsp;</p>\n\n<p>Sau đ&oacute;, Dương rủ Vũ Văn Tiến đột nhập căn biệt thự giết 6 người v&agrave;o rạng s&aacute;ng 7/7.</p>\n\n<p>Cảnh s&aacute;t nhận định, mặc d&ugrave; kh&ocirc;ng tiếp tục thực hiện h&agrave;nh vi phạm tội nhưng kh&ocirc;ng những kh&ocirc;ng can ngăn, tố c&aacute;o h&agrave;nh vi của Dương với cơ quan c&oacute; thẩm quyền m&agrave; Thoại c&ograve;n cung cấp hung kh&iacute; cho kẻ chủ mưu v&agrave; để mặc cho hậu quả xảy ra. Ch&iacute;nh con dao n&agrave;y đ&atilde; gi&uacute;p Dương l&agrave;m c&ocirc;ng cụ phạm tội c&ugrave;ng với Tiến, đ&acirc;m b&agrave; chủ nh&agrave; tử vong.&nbsp;</p>\n\n<p>14h h&ocirc;m nay, VKSND tỉnh B&igrave;nh Phước sẽ họp b&aacute;o, c&ocirc;ng bố c&aacute;o trạng truy tố 3 Dương, Tiến v&agrave; Thoại về tội Giết người v&agrave; Cướp t&agrave;i sản ở khung h&igrave;nh phạt cao nhất. C&aacute;c bị can được x&aacute;c định phạm v&agrave;o h&agrave;ng loạt t&igrave;nh tiết tăng nặng như: giết nhiều người, giết trẻ em, giết để thực hiện một tội danh kh&aacute;c, mang t&iacute;nh chất man rợ, c&ocirc;n đồ, đ&ecirc; h&egrave;n.</p>\n', '2015-11-04 14:14:25', '0', 0, 0, 0, ''),
(3, 2, NULL, 1, 'Vũng Tàu Beach', '<p>TAND tỉnh B&igrave;nh Phước đang l&ecirc;n kế hoạch đưa Nguyễn Hải Dương (24 tuổi, qu&ecirc; An Giang), Vũ Văn Tiến v&agrave; Trần Đ&igrave;nh Thoại ra x&eacute;t xử lưu động về tội Giết người, Cướp t&agrave;i sản. Đ&acirc;y l&agrave; c&aacute;c nghi phạm s&aacute;t hại 6 người trong biệt thự của đại gia ng&agrave;nh gỗ L&ecirc; Văn Mỹ (huyện Chơn Th&agrave;nh). Qu&aacute; tr&igrave;nh điều tra, nh&agrave; chức tr&aacute;ch x&aacute;c định Tiến v&agrave; Thoại đ&atilde; nhiều lần can ngăn Dương, muốn dừng tay thảm s&aacute;t nhưng &quot;rất yếu ớt&quot;.</p>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0" style="width:100%">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="Hai đồng phạm của Nguyễn Hải Dương (giữa) không ít lần muốn dừng tay thảm sát. Ảnh: Hoàng Trường" src="http://m.f29.img.vnecdn.net/2015/11/03/Hai-duong-2201-1446026374-6291-1446521779.jpg" style="width:100%" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Tiến (tr&aacute;i) v&agrave; Thoại (phải) kh&ocirc;ng &iacute;t lần muốn dừng tay thảm s&aacute;t. Ảnh: <em>Ho&agrave;ng Trường</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Theo kết luận điều tra, trước khi c&ugrave;ng Tiến s&aacute;t hại c&aacute;c nạn nh&acirc;n, Dương rủ Thoại thực hiện kế hoạch nhưng g&atilde; n&agrave;y v&igrave; qu&aacute; sợ h&atilde;i n&ecirc;n đ&atilde; bỏ cuộc v&agrave;o ph&uacute;t ch&oacute;t. Kh&ocirc;ng từ bỏ &yacute; định, ng&agrave;y 6/7, Dương mời Tiến uống c&agrave; ph&ecirc;, nhờ gi&uacute;p đỡ.</p>\r\n\r\n<p>Khi nghe bạn n&oacute;i &quot;m&agrave;y gi&uacute;p tao chuyện n&agrave;y, tao h&ugrave;n tiền mua gỗ cao su chừng 800 triệu đồng nhưng người đ&oacute; b&aacute;n gỗ&nbsp;m&agrave;&nbsp;kh&ocirc;ng chịu trả, giờ l&ecirc;n cướp lại&quot;, Tiến khuy&ecirc;n Dương b&aacute;o c&ocirc;ng an xử l&yacute;. Tuy nhi&ecirc;n, anh ta bịa: &quot;H&ugrave;n hạp kh&ocirc;ng c&oacute; giấy tờ l&agrave;m sao c&ocirc;ng an can thiệp&quot;.</p>\r\n\r\n<p>Khi hai người chở nhau từ S&agrave;i G&ograve;n xuống B&igrave;nh Phước, Tiến mới được Dương n&oacute;i kế hoạch g&acirc;y &aacute;n. &quot;Ch&uacute;t l&ecirc;n đ&oacute; tao điện thằng nhỏ ra mở cổng. Tao c&oacute; l&agrave;m g&igrave; thằng nhỏ, n&oacute; la l&ecirc;n th&igrave; m&agrave;y bịt miệng lại, tao v&agrave;o trong lấy tiền đi ra&quot;.</p>\r\n\r\n<p>V&agrave;o được cổng nh&agrave; &ocirc;ng Mỹ, Dương tr&oacute;i tay Dư Minh Vỹ (14 tuổi, ch&aacute;u nhưng thường gọi &ocirc;ng Mỹ l&agrave; cha) th&igrave; cậu b&eacute; la l&ecirc;n &quot;ba ơi&quot;. Tiến lập tức bịt miệng nạn nh&acirc;n, Dương b&oacute;p cổ.</p>\r\n\r\n<p>Chừng 2 ph&uacute;t sau, cậu b&eacute; bất tỉnh, Tiến n&oacute;i: &quot;Giờ về đi, thằng nhỏ c&ograve;n sống, c&ograve;n cứu được đ&oacute;&quot;. Dương trấn an: &quot;Tao đ&atilde; b&agrave;n với m&agrave;y như vậy rồi, giờ sao về được. Về l&agrave; hư chuyện của tao hết&quot;.</p>\r\n\r\n<p>Sau khi thấy bạn d&ugrave;ng dao giết cậu b&eacute;, Tiến khuy&ecirc;n: &quot;Th&ocirc;i về đi, thằng nhỏ chết kh&ocirc;ng ai biết đ&acirc;u&quot;. Dương lại động vi&ecirc;n đồng phạm: &quot;Lỡ rồi, giờ đi v&agrave;o nh&agrave; lấy tiền rồi về. Chứ về l&agrave; mai mốt kh&ocirc;ng l&agrave;m được đ&acirc;u&quot;.</p>\r\n\r\n<p>Dương đi trước v&agrave;o b&ecirc;n h&ocirc;ng biệt thự nhưng thấy Tiến vẫn đứng ở chậu c&acirc;y kiểng nơi Vỹ bị s&aacute;t hại n&ecirc;n ngoắc tay ra hiệu k&ecirc;u Tiến đi theo.</p>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0" style="width:100%">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="Nếu lúc ở cổng Tiến kiên quyết về hơn thì có thể thảm sát không xảy ra. Ảnh: Khánh Vinh" src="http://m.f29.img.vnecdn.net/2015/11/03/tham-sat-660x0-7675-1446521779.jpg" style="width:100%" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Nếu l&uacute;c ở cổng Tiến ki&ecirc;n quyết dừng lại&nbsp;th&igrave; thảm s&aacute;t đ&atilde; kh&ocirc;ng xảy ra. Ảnh: <em>Kh&aacute;nh Vinh</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Tr&egrave;o l&ecirc;n được tầng một, Dương n&oacute;i kế hoạch tiếp theo: &quot;Trong ph&ograve;ng c&oacute; 2 con nhỏ. Một nằm tr&ecirc;n giường, một dưới đất. M&agrave;y v&ocirc; khống chế con nhỏ dưới đất, tao khống chế nhỏ tr&ecirc;n giường&quot;. Nghe Tiến bảo kh&ocirc;ng l&agrave;m được v&agrave; đ&ograve;i đi về, Dương thuyết phục: &quot;Giờ lỡ rồi, v&ocirc; khống chế n&oacute; rồi lấy tiền đi về. L&agrave;m được m&agrave;, hai đứa n&oacute; hiền lắm&quot;.</p>\r\n\r\n<p>Dương bảo m&igrave;nh sẽ khống chế L&ecirc; Thị &Aacute;nh Linh (bạn g&aacute;i cũ, con g&aacute;i &ocirc;ng Mỹ) c&ograve;n Tiến sẽ &quot;l&agrave;m y chang&quot; với Như (chị của Vỹ). Khi v&agrave;o ph&ograve;ng Tiến lay nhưng Như vẫn ngủ n&ecirc;n kh&ocirc;ng khống chế theo kế hoạch, m&agrave; xua tay ra hiệu với Dương kh&ocirc;ng l&agrave;m được v&agrave; x&aacute;ch bal&ocirc; ra ban c&ocirc;ng bỏ về. Dương đi theo năn nỉ, Tiến n&oacute;i với vẻ sợ h&atilde;i: &quot;Tao kh&ocirc;ng l&agrave;m được đ&acirc;u m&agrave;y ơi. Tao c&ograve;n cha c&ograve;n mẹ nữa&quot;.</p>\r\n\r\n<p>&quot;Tao cũng c&ograve;n cha c&ograve;n mẹ. Th&ocirc;i lỡ rồi, v&ocirc; l&agrave;m đi, xuống lấy tiền rồi về&quot;, Dương n&oacute;i.</p>\r\n\r\n<p>Khống chế v&agrave; tr&oacute;i c&aacute;c c&ocirc; g&aacute;i v&agrave;o cửa sổ, hai thanh ni&ecirc;n xuống tầng trệt lần lượt tr&oacute;i b&eacute; Quốc Anh (con trai chủ nh&agrave;) v&agrave; vợ chồng &ocirc;ng Mỹ. Ch&uacute;ng đưa b&eacute; Quốc Anh v&agrave; vợ &ocirc;ng Mỹ qua ph&ograve;ng b&ecirc;n tra khảo nơi cất tiền kh&ocirc;ng được liền s&aacute;t hại. L&uacute;c n&agrave;y, nghe tiếng động ở cửa, Dương chạy ra th&igrave; ph&aacute;t hiện &ocirc;ng Mỹ đ&atilde; mở được d&acirc;y tr&oacute;i, đang mở cửa ph&ograve;ng định chạy trốn. Dương lao đến, d&iacute; dao v&agrave;o mặt &ocirc;ng, n&oacute;i: &quot;Chạy hả, đi v&ocirc;&quot;. &Ocirc;ng Mỹ run rẩy: &quot;Em đ&acirc;u c&oacute; chạy. Em tưởng mấy anh đi rồi n&ecirc;n em đi ra&quot;. Một l&aacute;t sau &ocirc;ng n&agrave;y cũng bị giết v&igrave; kh&ocirc;ng chỉ chỗ cất tiền.</p>\r\n\r\n<p>L&uacute;c n&agrave;y, Tiến n&oacute;i với Dương:&nbsp;&quot;Th&ocirc;i về đi, sắp s&aacute;ng người ta đến&quot;. Dương trả lời: &quot;Hai đứa n&oacute; (hai c&ocirc; g&aacute;i) biết tao, l&ecirc;n xử xong lu&ocirc;n đi rồi về. Lỡ rồi đi lu&ocirc;n đi&quot;. Tiến bảo: &quot;S&aacute;ng rồi l&agrave;m kh&ocirc;ng kịp đ&acirc;u&quot;. Dương năn nỉ: &quot;Kịp m&agrave;, l&ecirc;n l&agrave;m ch&uacute;t nữa rồi về lu&ocirc;n&quot;.</p>\r\n\r\n<p>G&acirc;y &aacute;n xong, cả hai lục lọi t&agrave;i sản. Khi quay lại ph&ograve;ng &ocirc;ng Mỹ lấy quần &aacute;o thay bộ đồ vấy m&aacute;u, Dương bật điện ph&ograve;ng l&ecirc;n th&igrave; b&eacute; Na (18 th&aacute;ng tuổi, con &uacute;t của &ocirc;ng Mỹ) kh&oacute;c, hắn bế c&ocirc; b&eacute; dỗ d&agrave;nh, ru ngủ rồi lục tủ lấy quần &aacute;o ra về. Gặp chiếc xe m&aacute;y c&agrave;y từ trong hẻm chạy ra quốc lộ 13, Dương n&oacute;i Tiến che biển số lại kẻo bị ph&aacute;t hiện.</p>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0" style="width:100%">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="Căn biệt thự nơi xảy ra vụ thảm sát ngày 6/7. Ảnh: Phước Tuấn" src="http://m.f29.img.vnecdn.net/2015/11/03/ang-mang-12-1436246541-660x0-8869-1446521779.jpg" style="width:100%" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Căn biệt thự nơi xảy ra vụ thảm s&aacute;t ng&agrave;y 6/7. Ảnh: <em>Phước Tuấn</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Về đến TP HCM l&uacute;c 6h30, ch&uacute;ng v&agrave;o ph&ograve;ng trọ của Tiến đ&oacute;ng cửa lại, kiểm tra số t&agrave;i sản cướp được rồi bỏ hết c&ugrave;ng hung kh&iacute; g&acirc;y &aacute;n v&agrave;o bal&ocirc;. Khi Dương quay trở lại B&igrave;nh Phước v&igrave; được người gi&uacute;p việc nh&agrave; &ocirc;ng Mỹ gọi điện b&aacute;o cả nh&agrave; &ocirc;ng n&agrave;y bị s&aacute;t hại, Tiến đem bal&ocirc; ra bờ s&ocirc;ng S&agrave;i G&ograve;n thuộc x&atilde; Nhị B&igrave;nh cất giấu.</p>\r\n\r\n<p>Ngo&agrave;i ra, trước khi thực hiện vụ thảm s&aacute;t, Dương đ&atilde; rủ người d&igrave; (31 tuổi) c&ugrave;ng đến nh&agrave; &ocirc;ng Mỹ để thăm d&ograve; Vỹ ra ngo&agrave;i c&oacute; bị ph&aacute;t hiện kh&ocirc;ng. Dương n&oacute;i dối d&igrave; l&agrave; đến nh&agrave; bạn lấy đồ, đ&uacute;ng với khung thời gian m&agrave; hắn sẽ đi c&ugrave;ng Thoại v&agrave; Tiến. Cả hai lần c&ugrave;ng đồng phạm đến biệt thự, Dương đều mượn xe m&aacute;y của người đ&agrave;n b&agrave; n&agrave;y. Trong đ&ecirc;m g&acirc;y &aacute;n, Dương d&ugrave;ng điện thoại mượn của một người bạn, gắn sim r&aacute;c v&agrave;o li&ecirc;n lạc với Vỹ.</p>\r\n\r\n<p>Cảnh s&aacute;t cho rằng d&igrave; v&agrave; bạn của Dương kh&ocirc;ng biết kế hoạch v&agrave; việc giết người của c&aacute;c bị can n&ecirc;n kh&ocirc;ng xem x&eacute;t tr&aacute;ch nhiệm h&igrave;nh sự.&nbsp;</p>\r\n\r\n<p>Nguyễn Hải Dương l&agrave; bạn trai của L&ecirc; Thị &Aacute;nh Linh. Sau một năm y&ecirc;u nhau, c&ocirc; g&aacute;i chủ động chia tay. Cho rằng hai người kh&ocirc;ng đến được với nhau l&agrave; do mẹ Linh ngăn cản, Dương nảy sinh &yacute; định giết cả gia đ&igrave;nh c&ocirc; g&aacute;i, cướp t&agrave;i sản. Do anh ta từng đến nh&agrave; nạn nh&acirc;n chơi nhiều lần n&ecirc;n th&ocirc;ng thuộc mọi ng&otilde; ng&aacute;ch.</p>\r\n', '2015-11-04 14:16:42', '0', 0, 0, 0, ''),
(4, 2, NULL, 1, 'Bình Ba Island', '<p>Với mong muốn tuy&ecirc;n truyền v&agrave; k&ecirc;u gọi nhiều hơn sự quan t&acirc;m đến thể dục thể thao, nhạc sĩ Kỳ Phương - cựu vận động vi&ecirc;n m&ocirc;n nh&agrave;o lộn - s&aacute;ng t&aacute;c ca kh&uacute;c <em>Tự h&agrave;o t&ocirc;i y&ecirc;u Việt Nam</em>. Ca kh&uacute;c lấy cảm hứng từ &quot;hiện tượng&quot; &Aacute;nh Vi&ecirc;n - người đạt nhiều th&agrave;nh t&iacute;ch tại đấu trường quốc tế về bơi lội.</p>\r\n\r\n<p>&Aacute;nh Vi&ecirc;n tham gia MV b&ecirc;n cạnh c&aacute;c vận động vi&ecirc;n v&agrave; nghệ sĩ Việt. Việc sắp lịch cho nữ k&igrave;nh ngư kh&ocirc;ng dễ d&agrave;ng v&igrave; c&ocirc; phải tu&acirc;n thủ lịch tập nghi&ecirc;m ngặt. Nhờ sự gi&uacute;p đỡ của l&atilde;nh đạo ng&agrave;nh Thể dục thể thao v&agrave; thầy của &Aacute;nh Vi&ecirc;n - HLV Đặng Anh Tuấn, c&ocirc; mới d&agrave;nh ra được một buổi để tham gia.&nbsp;&ldquo;T&ocirc;i h&aacute;t kh&ocirc;ng hay nhưng tham gia một dự &aacute;n &yacute; nghĩa như vậy, t&ocirc;i rất vui v&agrave; h&agrave;o hứng. C&aacute;c anh chị nghệ sĩ đ&atilde; tập h&aacute;t cho t&ocirc;i rất kỹ trước khi thu &acirc;m. Mong rằng qua MV, ng&agrave;y c&agrave;ng c&oacute; nhiều người y&ecirc;u th&iacute;ch v&agrave; quan t&acirc;m đến thể thao nước nh&agrave;&rdquo;, &Aacute;nh Vi&ecirc;n chia sẻ.</p>\r\n\r\n<table align="center" border="0" cellpadding="3" cellspacing="0" style="width:100%">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt="Ánh Viên và thầy giáo vẫn diện trang phục" src="http://c1.f9.img.vnecdn.net/2015/09/18/Anh-Vien-2-8683-1442546989.jpg" style="width:100%" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>&Aacute;nh Vi&ecirc;n v&agrave; thầy gi&aacute;o vẫn diện trang phục thể thao trong MV.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Kỳ Phương cho biết &quot;c&ocirc; g&aacute;i v&agrave;ng&quot; của bơi lội Việt Nam rất hiền l&agrave;nh v&agrave; chịu kh&oacute; tập b&agrave;i trước khi v&agrave;o ph&ograve;ng thu.&nbsp;Sau khi MV ho&agrave;n th&agrave;nh, c&ocirc; l&ecirc;n đường tham gia giải đấu thế giới tại Nga.&nbsp;Kỳ Phương cho biết: &ldquo;Khi đi c&ugrave;ng Phương Thanh sang Singapore xem &Aacute;nh Vi&ecirc;n&nbsp;v&agrave; c&aacute;c vận động vi&ecirc;n kh&aacute;c&nbsp;thi đấu, t&ocirc;i cảm thấy v&ocirc; c&ugrave;ng sung sướng, tự h&agrave;o. T&ocirc;i v&agrave; chị Chanh từ đ&oacute; nung nấu &yacute; định s&aacute;ng t&aacute;c ca kh&uacute;c mới cho ng&agrave;nh thể thao v&agrave; quay MV cổ động. Ban đầu, t&ocirc;i chỉ xem đ&acirc;y l&agrave; cuộc chơi nhỏ với một số anh em, bạn b&egrave; th&acirc;n thiết. Tuy nhi&ecirc;n, dự &aacute;n được rất nhiều người ủng hộ n&ecirc;n số người tham gia l&ecirc;n đến 100&quot;.</p>\r\n\r\n<p>C&aacute;c nghệ sĩ tham gia c&oacute;&nbsp;Phương Thanh, Thu Minh, Cẩm V&acirc;n, Khắc Triệu, Ngọc &Aacute;nh, MTV, Tiền Đạt, Phạm Hồng Phước, Hương Giang Idol, Minh Qu&acirc;n, Đại Nghĩa, Hiếu Hiền&hellip;&nbsp;Kinh ph&iacute; thực hiện dự &aacute;n lấy từ một phần tiền t&uacute;i của Kỳ Phương v&agrave; c&aacute;c bạn b&egrave;, doanh nh&acirc;n g&oacute;p lại.&nbsp;</p>\r\n\r\n<p>Sau khi ph&aacute;t h&agrave;nh MV, Kỳ Phương v&agrave; Phương Thanh sẽ tổ chức chương tr&igrave;nh biểu diễn tiết mục <em>Tự h&agrave;o t&ocirc;i y&ecirc;u Việt Nam</em> v&agrave;o tối 19/9 tại TP HCM. C&aacute;c nghệ sĩ Cẩm V&acirc;n, Khắc Triệu, Phương Thanh, Mỹ Lệ, Ngọc &Aacute;nh... c&ugrave;ng một số vận động vi&ecirc;n sẽ thể hiện trong đ&ecirc;m n&agrave;y.</p>\r\n', '2015-11-04 14:18:15', '0', 0, 0, 0, ''),
(5, 2, NULL, 1, 'Khu du lịch Dĩ An', '<p>jhvc</p>\r\n', '2015-11-04 14:41:28', '0', 0, 0, 0, ''),
(6, 2, NULL, 1, 'Khu du lịch Dĩ An', '<p>jhvc</p>\r\n', '2015-11-04 14:44:32', '0', 0, 0, 0, ''),
(7, 2, NULL, 1, 'Khu du lịch Dĩ An', '<p>jhvc</p>\r\n', '2015-11-04 14:46:51', '0', 0, 0, 0, ''),
(8, 2, NULL, 1, 'Khu du lịch Dĩ An', '<p>jhvc</p>\r\n', '2015-11-04 14:49:12', '0', 0, 0, 0, ''),
(9, 2, NULL, 1, 'Khu du lịch Dĩ An', '<p>jhvc</p>\r\n', '2015-11-04 14:50:37', '0', 0, 0, 0, ''),
(10, 2, NULL, 1, 'Khu du lịch Dĩ An', '<p>jhvc</p>\r\n', '2015-11-04 14:54:48', '0', 0, 0, 0, ''),
(11, 2, NULL, 1, 'Khu du lịch Dĩ An', '<p>jhvc</p>\r\n', '2015-11-04 14:59:55', '0', 0, 0, 0, ''),
(12, 2, NULL, 1, 'Vũng Tàu Beach', '<p>fasd</p>\r\n', '2015-11-04 15:14:37', '0', 0, 0, 0, ''),
(13, 2, NULL, 1, 'Vũng Tàu Beach', '<p>fasd</p>\r\n', '2015-11-04 15:15:02', '0', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `touristplace`
--

CREATE TABLE IF NOT EXISTS `touristplace` (
  `TourId` int(11) NOT NULL,
  `PlaceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UserId` int(11) NOT NULL,
  `FullName` text,
  `Birthday` date DEFAULT NULL,
  `Email` char(100) DEFAULT NULL,
  `Password` char(100) DEFAULT NULL,
  `LoginToken` char(100) DEFAULT NULL,
  `AccountType` varchar(10) DEFAULT NULL,
  `Phone` char(15) DEFAULT NULL,
  `Address` text,
  `CompanyName` text,
  `CompanyDescription` text,
  `Status` varchar(5) DEFAULT NULL,
  `ConfirmCode` varchar(50) DEFAULT NULL,
  `Avatar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `FullName`, `Birthday`, `Email`, `Password`, `LoginToken`, `AccountType`, `Phone`, `Address`, `CompanyName`, `CompanyDescription`, `Status`, `ConfirmCode`, `Avatar`) VALUES
(1, 'q', '2015-11-10', 'qq', 'q', 'q', 'q', 'q', 'q', 'qq', 'q', 'q', 'q', 'q');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`CommentId`),
  ADD KEY `FK_RELATIONSHIP_6` (`UserId`),
  ADD KEY `FK_RELATIONSHIP_7` (`PostId`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationId`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostId`),
  ADD KEY `FK_RELATIONSHIP_1` (`UserId`),
  ADD KEY `FK_RELATIONSHIP_2` (`CategoryId`),
  ADD KEY `FK_RELATIONSHIP_3` (`LocationId`);

--
-- Indexes for table `touristplace`
--
ALTER TABLE `touristplace`
  ADD PRIMARY KEY (`TourId`,`PlaceId`),
  ADD KEY `FK_RELATIONSHIP_5` (`PlaceId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `CommentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `LocationId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `PostId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`PostId`) REFERENCES `post` (`PostId`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`),
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`),
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`LocationId`) REFERENCES `location` (`LocationId`);

--
-- Constraints for table `touristplace`
--
ALTER TABLE `touristplace`
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`TourId`) REFERENCES `post` (`PostId`),
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`PlaceId`) REFERENCES `post` (`PostId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
