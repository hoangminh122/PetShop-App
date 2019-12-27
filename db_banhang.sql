-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2019 at 07:05 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(14, 14, '2017-03-23', 160000, 'COD', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 13, '2017-03-21', 400000, 'ATM', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 12, '2017-03-21', 520000, 'COD', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 11, '2017-03-21', 420000, 'COD', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(15, 15, '2017-03-24', 220000, 'COD', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(18, 15, 62, 5, 220000, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(17, 14, 2, 1, 160000, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(16, 13, 60, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 13, 59, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(14, 12, 60, 2, 200000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(13, 12, 61, 1, 120000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(12, 11, 61, 1, 120000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(11, 11, 57, 2, 150000, '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(15, 'ê', 'Nữ', 'huongnguyen@gmail.com', 'e', 'e', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(14, 'hhh', 'nam', 'huongnguyen@gmail.com', 'Lê thị riêng', '99999999999999999', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '23456789', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 'Khoa phạm', 'Nam', 'khoapham@gmail.com', 'Lê thị riêng', '1234567890', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '234567890-', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Đồ chơi con cá 3D', 5, '', 20000, 0, 'JZD49-393-do-choi-roi-ca-map-trang-3d-bang-nhua-mem-2.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'Mon Ami Toy Vinyl - Đồ chơi chó nhai giày', 5, 'Hình ảnh đồ chơi đã nói lên tất cả. Chó rất thích nhai mọi thứ, đặc biệt là chó con. Thay vì đánh phạt chúng, bạn hãy cho chó một một đồ chơi đủ hấp dẫn, chúng sẽ từ bỏ món giày dép đầy tẻ nhạt của bạn sớm thôi.\r\n\r\nNgoài ra, món đồ chơi này còn chăm sóc sức khỏe răng miệng cho chó thay một chiếc bàn chải qua quá trình vui chơi.\r\n\r\nĐược sản xuất từ cao su tự nhiên với độ cứng vừa phải', 35000, 32000, 'Do-choi-cho-nhai-giay.gif', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'Đồ chơi số 8 (32cm)', 5, '', 16000, 0, '84fccf00ede1aa320450f952b8e7704b&zimken.jpg', 'cai', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'Mon Ami Toy Vinyl - Đồ chơi con voi (cho chó)', 5, 'Đồ chơi hình con voi có vẻ ngoài vô cùng \"cute\" này sẽ là món quà lý tưởng cho những chú chó nghịch ngợm thích cắn phá đồ đạc trong nhà.\r\n\r\nQuá trình nhai của chó sẽ thay thế việc chải răng, giúp răng chó sạch và khỏe.\r\n\r\nSản phẩm được sản xuất từ cao su tự nhiên', 34000, 18000, 'Do-choi-con-voi.gif', 'cai', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'AFP Chill Out - Xương lạnh size L (cho chó)', 5, '', 16000, 0, '2956_xuongkepbanhpetcity1.jpg', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(11, 'Moderna - Nhà vệ sinh bầu dục 39x53x41', 3, 'Moderna - Nhà vệ sinh bầu dục 39x53x41\r\n\r\nLưới than hoạt tính, khử mùi\r\n\r\nMuỗng xúc\r\n\r\nCửa lật tự động\r\n\r\nDể vệ sinh và vận chuyển', 250000, 0, '2003_vs_1.jpg', 'cái', 0, '2016-10-12 02:00:00', '2019-12-25 02:24:00'),
(12, 'Lược Furminator cho mèo lông dài', 3, 'Cho mèo, lông dài hơn 7cm\r\n\r\nLược FURrminator là loại lược chuyên dụng được sản xuất cho mèo dưới 10lbs (tương với 5kg) với mặt lưỡi dài 3,2 cm dùng để loại bỏ hết lớp lông chết phía sâu bên trong.\r\n\r\nLược FURminator giúp bạn:\r\n\r\nLoại bỏ 90% lông rụng bằng cách loại bỏ các sợi lông chết ở sâu bên trong mà không hề làm tổn hại lớp lông khỏe mạnh của thú cưng.\r\n\r\nGiảm thiểu dị ứng cho người sống trong nhà.\r\nGiảm thiểu việc xuất hiện các cục lông rối.', 200000, 180000, '1282_furminatorchonholongdaipetcity.jpg', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(13, 'Bioline - Xịt vệ sinh đúng chỗ', 3, 'Sản phẩm là công cụ huấn luyện tuyệt vời giúp cho các chú chó mèo đi vệ sinh đúng chỗ và hình thành cho chúng những thói quên tốt trong tương lai\r\n\r\nTác dụng chính: Thuốc xịt có tác dụng hướng dẫn cho chó mèo đi vệ sinh một các đúng chỗ. Hoàn toàn không có hại đối với thú cưng và môi trường, thích hợp cho các bạn đào tạo huấn luyện thú cưng của mình\r\n\r\nHướng dẫn sử dụng: Xịt vào những khu vực mà bạn muốn chó mèo nhà mình đi vệ sinh vào đó. Mùi hương kích thước quen thuộc sẽ dẫn thú cưng nhà bạn đi vệ sinh chỗ đó. Thú cưng thường đi vệ sinh hằng ngày khi ngủ dậy, sau bữa ăn và sau khi chạy nhảy mệt mỏi, nên sử dụng sản phẩm vào những lúc này để được hiệu quả tốt nhất', 300000, 280000, 'xit-huong-dan-di-ve-sinh-dung-cho-bioline.png', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(14, 'Kit cat - Cát vệ sinh Kit cat đậu nành 7 lít', 3, 'Thành phần : Kitcat Soya là loại cát mèo phân hủy hoàn toàn, sử dụng nguyên liệu từ ngành sản xuất đậu nành, các thành phần xơ được sử dụng trong công thức tạo ra sản phẩm cát mèo ép viên thân thiện với môi trường.\r\n\r\nGói 7 lít khoảng 2,8kg.\r\n\r\n*Vón nhanh\r\n\r\n*Dễ dọn và có thể bỏ vào trong toilet.\r\n\r\n*Kiểm soát mùi tốt\r\n\r\n*Dùng được cho mèo con và mèo lớn\r\n\r\n*Êm chân\r\n\r\n*Không dính khay\r\n\r\n*1 túi dùng dc 30 ngày/ 1 con mèo.', 300000, 280000, 'p-cat-than-khoang-chat-kitcat-zeolite-tui-4kg-1686.jpg', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(15, 'Petstar - Túi + kẹp hót phân Piqapoo 20pcs size S', 3, 'Với những người sở hữu một chú chó hoặc bất cứ ai xui xẻo từng phải vật lộn với mớ hỗn độn mà chúng gây ra thì Piqapoo sẽ là một trong những sản phẩm hữu ích và tiềm năng nhất.\r\n\r\nPiqapoo là một chiếc kẹp mềm gắn vào đuôi các chú chó . Khi chúng đi vệ sinh, phân rơi vào một cái túi, thứ sau đó bạn có thể ném đi một cách dễ dàng. Và dĩ nhiên, bạn sẽ không cần phải dùng đến tay để hốt cho chúng nữa.\r\n\r\nTúi và kẹp hót phân có khả năng kỳ diệu trong việc \"bắt lấy\" các loại  phân  khác nhau và bạn không cần phải lo lắng gì vì đã có những chiếc túi không bao giờ bị rò rỉ này.', 350000, 320000, '3745_k.png', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(16, 'Bánh trái cây II', 3, 'Khay vệ sinh cho mèo được thiết kế đặc biệt với hai phần thành cao và thành thấp giúp không bị rơi cát và dễ dàng leo vào khay.\r\n\r\nKích thước: 58 x 52 x 22 cm.\r\nFerplast, có trụ sở tại Castelgomberto (tỉnh Vicenza - Ý), được thành lập vào năm 1966 bởi Carlo Vaccari. Trong 50 năm, Ferplast đã tham gia nghiên cứu và tạo ra các sản phẩm sáng tạo, an toàn với chất lượng cao nhằm đảm bảo cho sự chăm sóc thoải mái của vật nuôi. Công ty dành nhiều khoản đầu tư đáng kể cho nghiên cứu những công nghệ tiên tiến cho việc sản xuất.\r\n\r\nLà một doanh nghiệp thương mại điển hình của vùng Đông Bắc nước Ý, ngày nay Ferplast sản xuất hơn 2000 loại sản phẩm, có khoảng 1.000 nhân viên, phân phối không dưới 80 quốc gia trên thế giới và có chi nhánh tại Ý, Pháp, Đức, Anh, Scandinavia, Ba Lan, Ukraina, Slovakia, Nga, Benelux và Brazil, có 3 nhà máy sản xuất ở Ý, Ukraina và Cộng hòa Slovak.', 150000, 120000, '0180010153.gif', 'hộp', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(17, 'Mon ami - Xẻng hót cát cho chó mèo', 3, 'Xẻng hót cát, xẻng vệ sinh, màu sắc đẹp, chất liệu bền, chắc chắn, bán rẻ nhất tại PetCity.vn\r\n\r\n-Trọng lượng nhẹ.\r\n\r\n-Thuận tiện.\r\n\r\n- Vứt bỏ chất thải đúng cách.\r\n\r\n- Dễ dàng sử dụng bằng một tay.\r\n\r\n- Chất liệu nhựa cao cấp không chứa chất độc hại', 250000, 240000, 'xeng-hot-cat.jpg', 'cai', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(18, 'Doggy Dolly - Áo vest Tuxedo size XXL', 2, 'Sen muốn Boss cùng đi dạ tiệc, hay đơn giản Sen muốn Boss tỏa sáng hơn, Áo vest Tuxedo là sự lựa chọn vô cùng lý tưởng.\r\n\r\nVới thiết kế tinh tế của Doggy Dolly, Boss sẽ nổi bật và ấm áp hơn khi cùng Sen dạo phố đón những cơn gió đầu mùa. \r\nĐẶC ĐIỂM SẢN PHẨM:\r\nChất liệu vải bền bỉ\r\nTạo cảm giác thoải mái\r\nTăng vẻ quý phái cho thú cưng\r\nNhiều Size khác nhau: XXS - XXL\r\nChất liệu Polyester chính hiệu\r\nPhân phối chính hãng từ Thái Lan', 180000, 0, 'ao-vest-tuxedo.jpg', 'cai', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(19, 'Petstar bộ back to school size L', 2, 'Thương hiệu:\r\n\r\nMã SP: PETMP03DL\r\nSize L: 4-5kg', 150000, 100000, 'petstar.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(20, 'Petstar váy caro kẻ đỏ size XL', 2, 'Váy care kẻ sang trọng với hai màu ghi và đỏ. \r\n\r\nSize XL:5-6 kg\r\n\r\nThương hiệu: PetStar\r\n\r\nMã SP: PETMP01DXL', 350000, 0, 'vay-petstar.jpg', 'chiec', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(21, 'Áo Kimino nơ size L', 2, '+ Váy nơ công chúa màu sắc và kiểu dáng đẹp\r\n\r\n + Chất liệu mềm mại, êm ái, không kích ứng da, phù hợp cho cún yêu nhà bạn', 560000, 450000, 'kimino.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(22, 'Natural Core - Thức ăn hữu cơ cho chó con vị thịt cừu (7kg)', 1, 'Thức ăn hữu cơ cho chó con vị thịt cừu\r\nTrọng lượng : 7kg \r\n\r\nĐặc điểm nổi bật\r\nThức ăn hữu cơ cho chó con Natural Core thịt cừu được chế biến từ các loại thịt tươi và các nguyên liệu được chứng nhận hữu cơ ECOCERT: thịt cừu Úc và thịt nạc gà hữu cơ, khoai lang hữu cơ và ngũ cốc. Với nhiều chất dinh dưỡng tốt cho sức khỏe thú cưng, ECO5a có tác dụng nổi bật trong việc hỗ trợ sự phát triển của chó con.\r\n\r\nDành cho chó con dưới 2 tuổi, chó mẹ đang mang thai và cho con bú\r\nThành phần: thịt cừu Úc và thịt nạc gà hữu cơ, khoai lang hữu cơ và ngũ cốc\r\nKhông chứa thành phần gây dị ứng cho chó con như bắp, đậu nành, lúa mì\r\nTốt cho việc hình thành xương và giúp tăng cường chức năng đường ruột\r\nNgăn ngừa tình trạng dị ứng thức ăn ngay từ khi còn nhỏ\r\nTăng cường chức năng đường ruột và nâng cao hệ miễn dịch\r\nCung cấp protein chất lượng cao cho cún con tăng trưởng và phát triển\r\nCho cún con một làn da khỏe mạnh và bộ lông óng mượt\r\nĐặc tính - Công dụng\r\n - Thành phần hữu cơ tốt cho sức khỏe, đặc biệt phù hợp với chó con và chó mẹ\r\n\r\n - Ngăn ngừa tình trạng dị ứng thức ăn thường gặp ở cún con\r\n\r\n - Công nghệ đạm thủy phân, tối đa hóa khả năng hấp thu\r\n\r\n - Tăng cường hệ miễn dịch, sức đề kháng, cho hệ tiêu hóa khỏe mạnh\r\n\r\n - Cho cún cưng làn da khỏe mạnh và bộ lông óng mượt', 1400000, 1200000, 'NaturalCore.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, 'Thức ăn cho chó Poodle - Royal Canin Poodle Adult (500g)', 1, 'Thức ăn khô Royal canin Poodle Adult 500g\r\nDành cho thú cưng > 10 tháng tuổi\r\n\r\nThức ăn giúp:\r\n\r\nBóng màu lông: Thành phần Omega3 (EPA/DHA) và Omega6 axit béo tăng cường làm đẹp lông hiệu quả, tránh các bệnh viêm da. Tăng cường Protein và hàm lượng axit amin lưu huỳnh để đảm bảo sự tăng trưởng của lông cún\r\n\r\nNgoài ra thức ăn royal canin còn gồm 4 loại vitamin B tăng cường chức năng bảo vệ da cho cún\r\n\r\nTăng trưởng tối ưu: Với hàm lượng Protein 33% tăng cường chất đạm và tỷ lệ dinh dưỡng thích hợp để kiểm soát sự phát triển và trọng lượng của chó con\r\n\r\nGiảm cao răng: kết cấu dạng hạt đặc biệt có vai trò ngăn ngừa sự hình thành của các mảng bám cao răng, khiến cho răng cún luôn chắc khỏe\r\n\r\nTăng sức đề kháng: Nâng cao sức đề kháng dành cho chó con, giàu chất Oxy hóa bằng các Vitamin E, C, Taurine và Lutein', 122000, 0, 'RoyalCanin.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, 'NutriSource - Thức ăn cao cấp thịt gà, gạo lứt 142g (cho chó trưởng thành)', 1, 'Giới thiệu về NutriSource :\r\n\r\nCác thương hiệu thức ăn cho thú cưng NutriSource (NutriSource, PureVita, Hành tinh tự nhiên) được dành riêng cho sức khỏe lâu dài của vật nuôi trong gia đình. Chính sự cam kết đó là điều thúc đẩy họ tạo ra thức ăn vật nuôi chất lượng cao nhất mà bạn có thể mua.', 25000, 0, 'NutriSource.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, 'O\'fresh Cat 1.3kg', 1, '2.    Nguyên liệu:\r\nNguyên liệu chính: Bột thịt gà, bột thịt cừu, bột thịt gà thủy phân, gluten ngô, gạo, mỡ gà, bột nguyen trứng, dầu cá, hạt lanh, ngô, Beet pulp, bột lúa mỳ, chất chống oxy hóa, chiết xuất cây hương thảo, chiết xuất cây Yucca, các loại vitamin (A, B1, B2, B6, B12, Niacin, Pantothenic acid, D3, E, K, Biotin, Folic acid), các loại khoáng chất ( Fe, Zn, Mn, Se, I, Cu), Choline chloride, Phosphonic acid, Taurine, Potassium chloride\r\n\r\n*Nguyên liệu sử dụng trên đây tỉ lệ pha trộn có thể thay đổi tùy thuộc vào tình hình sản xuất.\r\n\r\n*Có sử dụng nguyên liệu biến đổi gen (GMO)\r\n\r\n3.    Công dụng: Mèo phát triển 2 ( Thức ăn hỗn hợp cho mèo trên 12 tháng tuổi)', 80000, 70000, 'Ofresh.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(26, 'Me-O - Thức ăn Meo kitten 1.1kg', 1, 'Bảo đảm an toàn, không bị hư hỏngkhi để bên ngoài và thời gian bảo quản sử dụng lâu(18 tháng), giúp giử vệ sinh, giảm sự tích tụ cao răng làm hư răng và đặc biệt nhất là giúp chất thải (phân) của thú cưng giảm hẳn những mùi khó chịu từ phân mèo\r\n\r\n \r\n\r\n- Nhập khẩu hàng Thái Lan\r\nTHÀNH PHẦN VÀ TÍNH NĂNG VƯỢT TRỘI từ Me-0 Kitten\r\n\r\n\r\nTaurine\r\nlà Acid Amino cần thiết cho chức năng của mắt và cải thiện thị giác của mèo\r\n\r\n\r\n\r\nVitamin C\r\nTăng cường hệ thống miễn dịch và giúp giảm tác động của stresslên sức khỏe của mèo\r\n\r\n\r\nCanxi,Photpho và Vitamin D\r\ngiúp làm chắc răng và xương\r\n\r\nFlutd\r\nCông thức này giúp ngăn ngừa bệnh đường tiết niệu trên\r\n\r\nmèo và sỏi bàng quang\r\n\r\nOmega 3&6 và Kẽm\r\nomega 3 và Omega 6 từ dầu chất lượng cao trong hợpchất với kẽm giúp nuôi dưỡng tóc và da mèo\r\n\r\nNatri thấp\r\nCông thức Natri thấp giúp giảm nguy cơ cao huyết áp,bệnh thaận à tim ở Mèo\r\n\r\n\r\nProtein từ Sữa và Cá Biển\r\nGiúp phát triển cơ thể và cơ bắp khỏe mạnh', 114000, 0, 'Me-o.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(27, 'NutriSource - Thức ăn cao cấp thịt gà, vịt, đậu hà lan 3kg (cho mèo)', 1, 'Các thương hiệu thức ăn cho thú cưng NutriSource (NutriSource, PureVita, Hành tinh tự nhiên) được dành riêng cho sức khỏe lâu dài của vật nuôi trong gia đình. Chính sự cam kết đó là điều thúc đẩy họ tạo ra thức ăn vật nuôi chất lượng cao nhất mà bạn có thể mua.\r\nThành phần :\r\n\r\nThịt gà, bột vịt, đậu Hà Lan, bột gà, đậu xanh, tinh bột sắn, bột gà tây, sản phẩm trứng khô, mỡ gà (được bảo quản bằng hỗn hợp tocopherols và axit citric), hương vị tự nhiên, tinh bột đậu, protein đậu, hạt lanh, chiết xuất men, sấy khô bưởi cà chua, men bia khô, bột cỏ linh lăng, axit photphoric, khoáng chất (protein sắt, kẽm protein, đồng proteinate, protein mangan, protein coban), kali clorua, DL methionine, cranberries, taurine, vitamin (vitamin A acetate, vitamin D3 , bổ sung vitamin E, niacin, d-canxi pantothenate, thiamine mononitrate, bổ sung riboflavin, pyridoxine hydrochloride, axit folic, biotin, vitamin B12) (nguồn vitamin C), chiết xuất yucca schidigera, L-Carnitine, canxi iodate, natri selenite, chiết xuất hương thảo, nuôi cấy nấm men (Saccharomyces cerevisiae), sản phẩm lên men Lactobacillus acidophilus khô sản phẩm lên men cus faecium, chiết xuất lên men Aspergillus niger khô, chiết xuất lên men Trichoderma longibrachiatum khô, chiết xuất lên men Bacillus subtilis khô', 550000, 450000, 'NutriSource-ga.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(28, 'Cỏ mèo dạng bột Hagen Cat', 1, 'Được thành lập từ năm 1997, với 20 năm kinh nghiệm, mục tiêu của AFP và Pawise là cung cấp các sản phẩm dành cho thú cưng với chất lượng tốt nhất, an toàn nhất với 95% sản phẩm đã được xuất khẩu sang thị trường Châu Âu và Châu Mỹ.\r\n\r\nAFP và Pawise luôn cố gắng hết sức để thiết kế những sản phẩm nhằm đáp ứng các nhu cầu của vật nuôi cũng như phù hợp với phong cách của chủ nhân.\r\n\r\nVới các nhà thiết kế đầy tính sáng tạo giàu kinh nghiệm, nhân viên chuyên nghiệp và đội ngũ quản lý có năng lực, AFP và Pawise đang khẳng định vị thế của mình trong lĩnh vực chăm sóc thú cưng, mong muốn mang đến những sản phẩm an toàn, đáng tin cậy cùng dịch vụ hiệu quả', 120000, 0, 'catnip.jpg', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(29, 'Bánh thưởng hình xương AFP Krazy Crunch Size S 4x3x1cm', 1, 'Được thành lập từ năm 1997, với 20 năm kinh nghiệm, mục tiêu của AFP và Pawise là cung cấp các sản phẩm dành cho thú cưng với chất lượng tốt nhất, an toàn nhất với 95% sản phẩm đã được xuất khẩu sang thị trường Châu Âu và Châu Mỹ.\r\n\r\nAFP và Pawise luôn cố gắng hết sức để thiết kế những sản phẩm nhằm đáp ứng các nhu cầu của vật nuôi cũng như phù hợp với phong cách của chủ nhân.\r\n\r\nVới các nhà thiết kế đầy tính sáng tạo giàu kinh nghiệm, nhân viên chuyên nghiệp và đội ngũ quản lý có năng lực, AFP và Pawise đang khẳng định vị thế của mình trong lĩnh vực chăm sóc thú cưng, mong muốn mang đến những sản phẩm an toàn, đáng tin cậy cùng dịch vụ hiệu quả', 100000, 0, 'krazy-crunch.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(30, 'Bio - Men hỗ trợ tiêu hóa Biotic cho chó mèo', 4, 'Công dụng:\r\n\r\n- Cung cấp vitamin và vi khuẩn có lợi, giúp ức chế các vi khuẩn có hại trong đường ruột, làm giảm tiêu chảy ở thú cưng.\r\n\r\n- Tăng tiêu hóa và hấp thu thức ăn.\r\n\r\n- Giảm khí độc và mùi hôi trong phân.\r\n\r\n \r\n\r\nCách dùng:\r\n\r\n1g/5kg thể trọng. Pha thuốc vào một ít nước và bơm vào miệng cho thú cưng uống, ngày 2 lần.', 380000, 350000, '1381_0_unnamed.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(31, 'Virbac Calci-Delice - Thuốc viên bổ sung canxi và khoáng chất (cho chó)', 4, 'Đảm bảo đáp ứng đủ về canxi và các khoáng chất (Bổ sung nguồn canxi và khoáng chất có tính khả dụng sinh học cao).\r\n\r\nMùi vị thơm ngon và dễ hấp thu.\r\n\r\nCông dụng :\r\n\r\nCalci Delice cung cấp canxi, vitamin D và khoáng chất thiết yếu dành cho các nhu cầu khác nhau như:\r\n\r\n- Chó con đang lớn: đảm bảo cơ xương phát triển tối ưu\r\n- Chó mẹ đang mang thai và nuôi con: không bị mất sức và có nhiều sữa nuôi con\r\n- Chó gặp các vấn đề về xương: yếu xương, loãng xương, gãy xương\r\n- Chó đua hoặc làm việc cường độ cao: bổ sung canxi, điều hòa tim mạch, ngăn tạo cục máu đông\r\n- Bảo vệ và ngăn ngừa sâu răng trên chó\r\n\r\n \r\n\r\nCách dùng : \r\n\r\n- 1 viên/10kg/ngày.\r\n\r\n- Cho ăn hàng ngày hoặc cách ngày, liên tục trong 30 ngày.', 380000, 350000, 'Calci.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(32, 'Viên dẻo Hip Joint hỗ trợ điều trị các vấn đề về xương cho chó', 4, 'DÙNG CHO CÚN:\r\n\r\n• Đau khớp. Đặc biệt Cún già, Cún mập, Cún thích vận động.\r\n\r\n• Cún bị tai nạn hoặc sau khi phẩu thuật.\r\n\r\n• Giúp Cún mọi độ tuổi bị đau hông, khớp và hỗ trợ chức năng mô liên kết.\r\n\r\nTỪ NAY ĐÃ CÓ HIP + JOINT HỖ TRỢ ĐIỀU TRỊ VỀ CẤU TRÚC VÀ CHỨC NĂNG KHỚP\r\n\r\n• Glucosamine giúp hỗ trợ cơ thể sản sinh chondroitin sulfates và hyaluronic acid (các Glycosaminoglycans), rất quan trọng cho sự phát triển của sụn, xương, gân, khớp, dây chằng, móng, da và lông. Nó giúp duy trì tính thoải mái, đàn hồi, sức mạnh và sự co giãn của sụn khớp.\r\n\r\n• Methylsulfonylmethane (MSM) là nguồn sulfur hữu cơ. Sulfur hỗ trợ duy trì chức năng mô liên kết.\r\n\r\n• Chondroitin Sulfates hỗ trợ chức năng và cấu trúc của mô liên kết và các khớp. Chondroitin sulfates tinh chế trong Hip+Joint lấy từ nguồn được chứng nhận sụn bò không mắc BSE.\r\n\r\n• Vitamin C và Manganese cần thiết để sản sinh collagen và glycosaminoglycans. Vitamin C cũng bảo vệ mô bào khỏi các gốc tự do.\r\n\r\n• Dimethylglycine (DMG) hỗ trợ sự sản sinh nhiều thành phần trong cơ thể. Nó hoạt động như một chất chống oxi hoá bảo vệ khớp khỏi các gốc tự do.\r\n\r\n• Omega-3, Eicosapentaenoic Acid (EPA) và Docosahexaenoic Acid (DHA) từ dầu cá, là các tiền chất từ nhóm PGE3 của prostaglandins, những chất quan trọng giúp điều hoà cơ thể và sự thoải mái của khớp. Dầu cá cũng quan trọng cho chức năng tối ưu của khớp. Nó cân đối prostaglandins và leukotrienes để hỗ trợ sức khỏe khớp và mô liên kết.', 380000, 350000, '3441_PETTDT011923.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(33, 'Virbac Megaderm - Gel ăn dinh dưỡng cho chó', 4, 'Sản phẩm bổ sung dinh dưỡng cung cấp premix khoáng và các axit béo thiết yếu (EFA) từ nhóm Omega 6 và Omega 3 nguồn gốc thiên nhiên. \r\n\r\nVitamin A và E có trong sản phẩm giúp kiểm soát các bệnh khác nhau trên da, đặc biệt là bệnh dị ứng với 2 tác động, phục hồi sự hoàn thiện của da và điều trị viêm nhiễm (sưng đỏ, ngứa).\r\n\r\nCông dụng :\r\n\r\n    - Giảm triệu chứng ngứa và dị ứng, giảm rụng lông.\r\n\r\n    - Hỗ trợ làm lành vết thương và tăng khả năng phòng vệ tự nhiên của thú cưng.\r\n\r\n    - Duy trì vẻ mượt mà của da, lông.\r\n\r\n Cách dùng : \r\n\r\n- Có thể cho ăn trực tiếp hoặc trộn với thức ăn.\r\n\r\n- Liều lượng: 1 gói (4ml) / 10kg thể trọng mỗi ngày.\r\n\r\n- Kiểm soát các bệnh trên da: cho ăn mỗi ngày, trong 4-8 tuần.\r\n\r\n- Duy trì da lông khỏe: cho ăn mỗi 2 ngày, trong 4-8 tuần.', 280000, 250000, '643_5025130virbac_megaderm_2_4905763.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(34, 'Giấy vệ sinh tai cho mèo Lee & Webster', 4, 'Đặc điểm:\r\n\r\nGiấy vệ sinh tai cho mèo Lee & Webster được thiết kế nhỏ gọn và tiện dụng giúp loại bỏ một cách dễ dàng các vảy nến, bụi bẩn bên trong và khu vực xung quanh tai. Đặc biệt không gây kích ứng cho da và giữ cho đôi tai luôn được sạch sẽ.\r\n\r\nDung tích: 40 pads\r\n\r\nHiệu quả sử dụng:\r\n\r\nLàm sạch tai và phòng ngừa bệnh viêm tai giữa.\r\n\r\nHướng dẫn sử dụng:\r\n\r\nNhẹ nhàng lau sạch các vết bẩn bên trong và xung quanh tai, nên kết hợp với dung dịch vệ sinh tai cho mèo Lee & Webster để có kết quả tối ưu. Sử dụng 2 đến 3 lần 1 tuần và sau khi tắm gội', 280000, 0, 'fe909b9304678f4e1673e59bcfbab01e.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(35, 'Budle\'Budle - Dung dịch nhỏ mắt HQ', 4, 'Công dụng : Thuốc nhỏ quanh vòm mắt với tinh chất từ dầu ô liu giúp làm sạch các vết ố bẩn dưới mắt và ngăn ngừa nhiễm trùng, sự sản sinh của vi khuẩn\r\n\r\nCách sử dụng : nhỏ 3-4 giọt vào vết ố bẩn quanh mắt, sau đó dùng khăn sạch hoặc bông nhẹ nhàng lau sạch. Không nhỏ sản phẩm trực tiếp vào mắt chó mèo.\r\n\r\nChỉ định : - Có thể dùng hàng ngày để lau các vết ố quanh mắt do nước mắt chó mèo chảy.\r\n\r\n- Không sử dụng trong trường hợp chó mèo bị đau mắt.\r\n\r\nBảo quản : ở nơi thoáng mát, tránh ánh sáng trực tiếp.\r\n\r\nThể tích :  chai 120ml\r\n\r\nXuất xứ : Hàn quốc', 90000, 80000, '1436_0_img_8702.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(36, 'Frontline Plus- Thuốc trị ve rận nhỏ gáy cho mèo', 4, 'Giá bán của 1 tuýp\r\n\r\nCông dụng:\r\n\r\n-         Phòng và trị bọ chét, ve trên chó mèo từ 8 tuần tuổi trở lên\r\n\r\n-         Phòng và cắt sự quấy rối của ve và bọ chét\r\n\r\n-         Phòng và tiêu diệt trứng, nhộng và bọ chét trưởng thành, ngay cả bỏ chét gây viêm da dị ứng\r\n\r\n-         Tiêu diệt tất cả loài bọ chét ( lây truyền bệnh Lyme)\r\n\r\n-         Phòng và kiểm soát tái nhiêm.\r\n\r\n-         Tác động nhanh, kéo dài\r\n\r\n-         Không thấm nước, tiện lợi và an toàn khi sử dụng\r\n\r\nPhương thức\r\n\r\n-         Sau 1 tháng sử dụng Frontline Plus đã phá vỡ được hoàn toàn vòng đời của bọ chét và kiểm soát được sự lây nhiễm của ve rận\r\n\r\n-         Các nghiên cứu đã chứng minh rằng tiêu diệt được trứng, nhộng và bọ chét trưởng thành cho đến 3 tháng. Tiêu diệt được ve ít nhất 1 tháng và chỉ cần một lần sử dụng sẽ kiểm soát được ve trên cơ thể chó mèo.\r\n\r\n-         Frontline Plus  duy trì được hiệu quả sau khi thú cưng tắm, nhúng nước hay phơi dưới ánh nắng.\r\n\r\nCách sử dụng:\r\n\r\n-         Lấy ống thuốc ra khỏi bao. Giữ ống thuốc thẳng đứng và bẻ gãy đầu ống thuốc. Nhớ đưa ống thuốc ra xa khỏi cơ thể chủ vật nuôi.\r\n\r\n-         Đặt đầu ống thuốc lên da thú cưng đoạn giữa hai xương bả vai . Bóp ống thuốc nhẹ nhàng để đẩy toàn bộ thuốc trong ống lên một đường trên da thú cưng. Lưu ý bôi thuốc trực tiếp lên da thú cưng để thuốc có thể ngấm qua da thú chứ không bôi lên lông thú.\r\n\r\n-         Chia thuốc theo đúng cân nặng của thú cưng để phát huy tối đa hiệu quả của thuốc', 120000, 100000, 'frontline.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(37, 'Virbac Endogard 10 - Thuốc trị giun', 4, '*Điều trị rộng, tiêu diệt giun tròn, sán dây, nguyên sinh động vật và đặc biệt là giun tim. \r\n\r\n - An toàn cho tất cả các giống chó, các lứa tuổi kể cả chó mang thai. \r\n\r\nSản phẩm rất ngon miệng do đó việc sử dụng thuốc trở nên dễ dàng hơn.\r\n\r\n \r\n\r\nThành phần :\r\n\r\nFebantel là thuốc trừ giun sán được dùng qua đường miệng cho gia súc để điều trị và kiểm soát các ký sinh vật đường ruột.\r\n\r\nPyrantel gây ra sự tê liệt khả năng di động kéo dài của giun ký sinh và dẫn đến sự trục xuất chúng ra khỏi vật chủ.\r\n\r\nPraziquantel có tác dụng chống lại nhiều loài sán dây và sán lá.\r\n\r\nIvermectin gây tê liệt ở giun tròn và các động vật chân đốt dẫn đến tiêu diệt chúng.\r\n\r\n \r\n\r\nCách dùng : \r\n\r\n   - 1 viên Endogard 10 dùng cho 10kg cân nặng. Có thể dùng riêng hoặc dùng chung với thức ăn.\r\n\r\n   - Chó con có thể dùng Endogard 10 để xổ lãi bắt đầu từ 2 tháng tuổi và dùng định kỳ hàng tháng.\r\n\r\n   - Để điều trị nguyên sinh động vật cần dùng 1 liều Endogard 10 theo cân nặng và mỗi 24 giờ trong vòng 3 ngày.', 65000, 30000, '692_thuoc_so_giun_virbac_e1552116045544.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(38, 'Bayer Drontal Plus - Thuốc tẩy giun cho chó (dạng viên)', 4, 'Công dụng\r\n\r\nĐiều trị và phòng ngừa tất cả  các loại giun tròn đường tiêu hóa như: giun đũa (Toxocara canis, Toxascaris leonina), giun móc (Uncinaria stenocephala, Ancylostoma caninum), giun tóc (Trichuris vulpis)\r\nĐiều trị và phòng ngừa các loại sán dây (Echinococcus spp, Taenia spp, Dipylidium spp)\r\n \r\n\r\nCách dùng\r\n\r\nThuốc cho uống trực tiếp hoặc giấu vào thức ăn. Nên cho chó uống ngay trước khi ăn. Một viên Drontal® cho 10 kg thể trọng.\r\n\r\nĐiều trị bệnh do Giardia: 1 viên Drontal® cho 10 kg thể trọng liên tục trong 3 ngày.', 50000, 30000, '321_untitled.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(39, 'Bio - Xịt Bio-Finil trị ve, rận, bọ chét, cái ghẻ trên cho chó mèo', 4, 'Công dụng :\r\n\r\nDiệt sạch ve, rận, bọ chét và ghẻ Sarcoptes trên cơ thể chó, mèo với hiệu quả kéo dài 4 - 6 tuần \r\n\r\n \r\n\r\nCách dùng : \r\n\r\n - Vạch ngược lông, đặt vòi xịt cách bề mặt da 10cm , rồi xịt thuốc trực tiếp lên da \r\n\r\n - Nhiễm ve ít hoặc nhiễm rận, bọ chét, cái ghẻ : xịt 3ml / kg thể trọng (15 lần xịt)\r\n\r\n - Nhiễm ve nặng : xịt 6ml / kg thể trọng (30 lần xịt)\r\n\r\n** Đặc biệt chú ý đến các kẽ móng chân, tai, quanh cổ là các vùng thường nhiễm nhiều ve.\r\n\r\n - Dùng tay xoa đều thuốc sau vài lần xịt để thuốc phân bổ đều khắp cơ thể \r\n\r\n \r\n\r\nLƯU Ý :\r\n\r\n - Phun thuốc ở nơi thông thoáng \r\n\r\n - Mang bao tay khi phun thuốc, không phun thuốc vào mắt, mũi, miệng chó, mèo\r\n\r\n - Dùng lặp lại lần 2 sau 4-6 tuần nếu bị tái nhiễm \r\n\r\n - Không cho chó, mèo ở gần nguồn lửa trong vòng 30\' sau khi phun thuốc và không tắm trong vòng 48h sau khi phun thuốc.\r\n\r\n - Để thuốc cách xa tầm tay trẻ em, nguồn nhiệt.', 350000, 330000, 'Bio-Fin.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(40, 'Virbac Nutri-Plus Gel - Gel ăn dinh dưỡng', 4, 'Dung tích : 120,5g\r\n\r\n- Cung cấp nguồn năng lượng cao cấp, dễ hấp thu.\r\n\r\n- Duy trì vẻ đẹp của da, lông, tăng cường sức khoẻ.\r\n\r\n- Khôi phục cảm giác ngon miệng.\r\n\r\nNutriplus Gel là sản phẩm dinh dưỡng cao năng lượng dành cho chó mèo.Không giống như những sản phẩm sử dụng carbohydrate thực vật làm năng lượng chính, Nutriplus Gel sử dụng các chất dinh dưỡng có nguồn gốc động vật giúp chuyển đổi thành năng lượng một cách dễ dàng và nhanh chóng.\r\n\r\nCông dụng :\r\n\r\nNutriplus Gel được khuyến cáo sử dụng trước và sau những trường hợp chó mèo mất nhiều năng lượng trong khoảng thời gian ngắn như:\r\n\r\n-Trong thời gian mang thai hoặc tiết sữa.\r\n-Trong thời gian luyện tập, thi đấu.\r\n-Cần hồi phục nhanh ( sau khi giải phẫu, sau khi mắc bệnh nhiễm trùng…)\r\n-Chó, mèo con đang lớn.\r\n-Biếng ăn, giảm cân\r\n-Khôi phục sức khoẻ da, lông\r\n\r\n \r\n\r\nCách dùng : \r\n\r\nCó thể cho ăn trực tiếp hoặc trộn với thức ăn. Để cho dễ ăn, trước tiên nên cho một lượng nhỏ vào miệng thú để làm quen, sau đó có thể cho ăn với liều lượng như trên.\r\n\r\nLiều lượng: 1-2 muỗng canh / 5kg thể trọng (10cm) mỗi ngày. Có thể gấp đôi liều nếu cần thiết.', 30000, 20000, '66ffb1aea494aa1da5ae411d6cf46b74.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(41, 'Canxi Phốt Pho-hỗ trợ điều trị cho thú cưng', 4, '- Canxi Phốt Pho của hãng PetAg ( Mỹ ) là canxi hàng đầu trong việc điều trị bệnh liên quan đến hệ thống khung xương của chó mèo như sập bàn, hạ bàn, thiếu canxi, còi xương v...v...\r\n\r\n- Với công thức cân bằng kết hợp canxi hàm lượng cao với Phốt Pho và Vitamin D trong cùng 1 viên thuốc giúp động vật có thể hấp thụ canxi tối ưu để phát triển khung xương chắc khoẻ hoặc đáp ứng nhu cầu canxi cho động vật đang trong thời kì sinh sản, mang thai.\r\n\r\n- Canxi Phốt pho dạng viên nén với mùi vị hấp dẫn rất dễ sử dụng cho các loại động vật.\r\n\r\nHướng dẫn sử dụng :\r\n\r\nCho chó :\r\n\r\n+ Để bổ sung hàng ngày : dùng 1/2 viên cho 10 kg trọng lượng cơ thể\r\n\r\n+ Chó điều trị hạ bàn, sập bàn, cong chân, chó mẹ mang thai, chó đang trong giai đoạn tăng trưởng : 1 viên cho 10 kg trọng lượng cơ thể. Chú ý : không được dùng quá 3 viên /ngày\r\n\r\nCho mèo :\r\n\r\n+ Để bổ sung hàng ngày : dùng 1/4 viên cho 2 kg trọng lượng cơ thể\r\n\r\n+ Mèo điều trị thiếu canxi, liệt chân, mèo mẹ đang mang thai: 1/2 viên cho 2 kg trọng lượng cơ thể. Chú ý : Không được dùng quá 1 viên /ngày\r\n\r\n- Lưu ý khi sử dụng :\r\n\r\n+ Tất cả các thuốc Vitamin và khoáng chất chủ vật nuôi nên cho uống trước 10gìơ sáng để cơ thể thú cưng hấp thụ được tốt nhiều nhất các chất dinh dưỡng.\r\n\r\n+ Vật nuôi bắt buộc phải được tắm nắng hàng ngày hoặc nuôi trong môi trường có ánh sáng mặt trời để cơ thể thú cưng tự tổng hợp được canxi, phát triển toàn diện.\r\n\r\n- Thành phần dinh dưỡng trong 1 viên\r\n\r\n+ Canxi .....360mg\r\n\r\n+ Photpho... 250mg\r\n\r\n+ Vitamin D3 .... 245IU\r\n\r\n- Bảo quản : để sản phẩm nơi khô mát, tránh ánh sáng mặt trời.\r\n\r\nHộp 50 Viên\r\n\r\nXuất xứ : Mỹ', 350000, 330000, '1413_0_canxi_phospho_1_500x500.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(42, 'CTCBio - Lồng vận chuyển vuông lớn', 6, '*Kích thước : 50 * 34 * 31\r\n \r\nChất liệu nhựa cao cấp, bền, đẹp, không chưa chất độc hại, không gây kích ứng cho da và lông của thú cưng.\r\n\r\nCó tay cầm chắc chắn, thuận tiện cho việc đưa thú cưng của bạn đi bất cứ nơi đâu.\r\n\r\nNắp cài tiện dụng, thiết kế hiện đại thoáng mát, giúp thú cưng nhà bạn cực kỳ thoải mái.', 500000, 430000, '3625_long_ferplast_professional_petcity.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(43, 'Balo vận chuyển chó mèo Phi hành gia (da)', 6, 'Túi dùng để vận chuyển thú cưng: chó, mèo gồm nhiều màu sắc cho bạn chọn lựa\r\n\r\nĐẶC ĐIỂM NỔI BẬT\r\n\r\n- Thiết kế phi hành gia độc đáo, dễ thương\r\n\r\n- Chất liệu da mềm mại, thoáng khí.\r\n\r\n- 2 cửa tích hợp (cầu tròn, lưới phẳng) dễ dàng thay đổi. \r\n\r\n- Màu sắc nổi bật, bắt mắt', 120000, 0, '2578_balophihanhgiadapetcity3.jpg', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(44, 'Petstar - Balo di chuyển phi hành gia (nhựa trong)', 6, 'Với sản phẩm này, chó mèo cưng của bạn có thể nhìn ra thế giới và tận hưởng phong cảnh, nhìn ngắm bên ngòai, tương tác với thế giới bên ngoài\r\nĐiểm đặc biệt của balo là nhựa trong sang trọngSản phẩm được làm từ những chất liệu thân thiện, không độc hại và nhất là dễ dàng lau chùi khi bám bẩn.\r\n\r\nSản phẩm phù hợp cho vật nuôi có trọng lựơng dưới 6kg', 700000, 0, '0cfcb0e9d267d92609a6eb767136c67b_tn.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(45, 'Ferplast Atlas Trendy - Lồng vận chuyển chó mèo (size S)', 6, 'Sản phẩm thích hợp cho chó nhỏ và mèo, rất tiện lợi khi mang đi du lịch. Chất liệu lồng bằng nhựa cao cấp thoáng mát và cửa khung thép chắc chắn, cầm chắc tay.\r\n\r\nSize S: 48 x 33 x 29 cm', 678000, 0, 'long-van-chuyen-ferplast-atlas-trendy-cho-cho-meo.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(46, 'Petstar - Túi xách nhựa trong trung', 6, 'Với sản phẩm này, chó mèo cưng của bạn có thể nhìn ra thế giới và tận hưởng phong cảnh, nhìn ngắm bên ngòai, tương tác với thế giới bên ngoài\r\nĐiểm đặc biệt của túi là nhựa trong sang trọng.Sản phẩm được làm từ những chất liệu thân thiện, không độc hại và nhất là dễ dàng lau chùi khi bám bẩn.\r\n\r\nThiết kế màu sắc bắt mắt, kiểu dáng sang trọng.', 260000, 0, '3767_8888888888.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(47, 'Nệm lông thú ABC size 4', 6, '', 140000, 0, '4181_aaa.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(48, 'Nhà hình quả dâu ABC màu xanh 38 x 45 x 38cm', 6, '+ Với nhiều người, chó mèo không chỉ là động vật giúp giữ nhà, đuổi chuột mà còn là người bạn nhỏ thân thiết và rất trung thành.\r\n\r\n+ Do đó, hãy thể hiện tình yêu thương của bạn dành cho “người bạn nhỏ” đáng yêu này bằng cách trang bị cho chúng một ngôi nhà nhỏ, ấm cúng và êm ái để thú cưng có một nơi thư giãn thật thoải mái.\r\n\r\nĐẶC ĐIỂM NỔI BẬT\r\n- Ngôi nhà được làm từ chất liệu cotton thông thoáng, dễ vệ sinh và phù hợp với khí hậu nóng ẩm ở Việt Nam.\r\n- Bề mặt nằm có lớp lót cotton êm cùng thiết kế hình quả dâu với 3 mặt bao quanh nhằm tạo cho thú cưng của bạn cảm giác được che chở an toàn và ấm áp.\r\n- Nhà cho thú cưng sử dụng gam màu nổi bật kết hợp với những chấm nhỏ mô phỏng quả dâu, đây chắc chắn sẽ là nơi thư giãn lý tưởng, làm hài lòng những chú cún con xinh xắn.', 299000, 0, '1121_nha_hinh_qua_dau_abc_xanh_38x45x38cm.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(49, '\r\nThương hiệu: Natural Core\r\n\r\nMã SP: PETRBNC301\r\n\r\n \r\nrate Có 0 người dùng đánh giá\r\n185.000đ\r\n\r\nSố', 7, 'Dung tích : 500ml\r\n\r\n(Dùng được cho cả chó và mèo)\r\n\r\nĐặc điểm nổi bật \r\nXịt khử mùi diệt khuẩn trong gia đình, nhà ở…\r\nHương hoa nhài nhẹ nhàng êm dịu\r\n100% thành phần hữu cơ thiên nhiên\r\nKhử mùi tuyệt vời, mang lại bầu không khí trong lành\r\nHiệu quả, an toàn, nhanh chóng, tiện dụng\r\nKhử sạch mùi hôi trên cơ thể thú cưng\r\nLoại bỏ nhanh chóng và triệt để đến 99.9% các loại vi khuẩn\r\nĐặc tính - Công dụng \r\n   - Sản phẩm được sản xuất theo công thức đặc biệt chứa 100% thành phần tự nhiên\r\n\r\n   - Hiệu quả diệt khuẩn đã được kiếm nghiệm và chứng nhận\r\n\r\n   - Công nghệ khử mùi hôi độc đáo', 120000, 100000, '3573_31239570_1818786591477011_1295069292718456832_n.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(50, 'Fay Repell - Thuốc xua đuổi chó mèo, chống phóng uế bừa bãi 200ml', 7, '* Tính năng:\r\n\r\nXua đuổi thú khỏi nơi đã xịt FAY REPELL, ngăn chặn thú không tiếp tục phóng uế lên chỗ cũ.\r\nXua đuổi thú không cắn phá đồ vật đã xịt FAY REPELL.\r\nKhử mùi hôi và diệt khuẩn chỗ thú đã tiêu, tiểu.\r\n* Hướng dẫn sử dụng:\r\n\r\nXịt lên chỗ thú thường đi tiêu tiểu, sau khi đã dọn sạch.\r\nXịt lên đồ vật thú thường cắn phá hay chỗ không muốn thú lưu trú…\r\nXịt lên ít nhất 1 lần / 1 ngày trong 10 ngày đầu sau đó xịt 1 lần / 2 ngày trong khoảng 10 ngày kế tiếp.\r\n\r\n*Bảo Quản :\r\n\r\nĐể nơi khô ráo , tránh ánh nắng trực tiếp .\r\n\r\n \r\n\r\n*Cảnh Báo :\r\n\r\nChỉ dùng cho thú nuôi ,chỉ sử dụng bên ngoài ,\r\nSản phẩm này không phải là thuốc , chế phẩm sinh học hay hóa chất dùng trong thú y , Không có tác dụng thay thế thuốc trong thú y\r\nĐể xa tầm tay trẻ em .', 120000, 100000, '630_1_630_1_fay_repell.jpg', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(51, 'Mon Ami Enzo - Bàn chải massage', 7, '', 15000, 0, '1285_b__n_ch___i.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(52, 'Xịt Tropiclean chăm sóc răng miệng cho chó và mèo', 7, 'Sản phẩm dạng xịt, giúp vật nuôi có hơi thở thơm mát một cách nhanh chóng mà không cần phải đánh răng. Xịt hàng ngày để có hơi thở thơm mát, loại trừ mảng bám và loại trừ nguy cơ mắc các bệnh về răng miệng ở chó và mèo.\r\n\r\nThành phần chính: Purified Water, Glycerin, rượu có nguồn gốc tự nhiên, polysorbate 20, bạc hà, Citric Acid, chiết xuất lá trà xanh, Zinc Chloride (0.01g/10ml), baking soda, Chlorophyll.\r\n\r\nCách dùng: Xịt 1 lần trực tiếp vào miệng thú cưng, ngày xịt từ 2-3 lần thay cho việc chải răng bằng bàn chải.\r\n\r\nBảo quản: Nơi thoáng mát, tránh ánh sáng trực tiếp.\r\n\r\nHSD: 5 năm kể từ ngày sản xuất        Xuất xứ :  Mỹ', 150000, 0, '4115_1.jpg', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(58, 'Doggy Dolly - Đầm caro xanh nơ trắng size XL', 2, 'Với thiết kế tinh tế của Doggy Dolly, Boss sẽ nổi bật và ấm áp hơn khi cùng Sen dạo phố đón những cơn gió đầu mùa.\r\n\r\nĐẶC ĐIỂM SẢN PHẨM:\r\nChất liệu vải bền bỉ\r\nTạo cảm giác thoải mái\r\nTăng vẻ quý phái cho thú cưng\r\nNhiều Size khác nhau: XXS - XXL\r\nChất liệu Polyester chính hiệu\r\nPhân phối chính hãng từ Thái Lan', 200000, 180000, 'dam-caro-xanh-no-trang.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(59, 'Petstar bộ back to school size L', 2, 'Thương hiệu:\r\n\r\nMã SP: PETMP03DL\r\nSize L: 4-5kg', 200000, 0, '4062_backtoshool.jpg', 'chiec', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(60, 'Doggy Dolly Body Harness - Yếm cherry xanh dương size L', 2, 'Yếm Cherry xanh dương duyên dáng, thích hợp với những Boss mê làm điệu!\r\n\r\nVới thiết kế tinh tế của Doggy Dolly, Boss sẽ nổi bật và ấm áp hơn khi cùng Sen dạo phố đón những cơn gió đầu mùa. \r\n\r\n \r\n\r\nĐẶC ĐIỂM SẢN PHẨM:\r\nChất liệu vải bền bỉ\r\nTạo cảm giác thoải mái\r\nTăng vẻ quý phái cho thú cưng\r\nNhiều Size khác nhau: XXS - XXL\r\nChất liệu Polyester chính hiệu\r\nPhân phối chính hãng từ Thái Lan', 200000, 0, 'yem-cherry-xanh.jpg', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(61, 'Nệm lông thú ABC size 3', 6, 'Những chiếc cupcake có cấu tạo gồm phần vỏ bánh xốp mịn và phần kem trang trí bên trên rất bắt mắt với nhiều hình dạng và màu sắc khác nhau. Cupcake còn được cho là chiếc bánh mang lại niềm vui và tiếng cười như chính hình dáng đáng yêu của chúng.', 367000, 220000, '4180_aaa.jpg', 'cái', 1, NULL, NULL),
(62, 'Nhà lều Angry birds', 6, 'Nhà Angry birds cho chó mèo, kiểu dáng và màu sắc đẹp, hấp dẫn thú cưng nhà bạn, chất liệu bền, chắc chắn, bán rẻ nhất tại PetCity.vn\r\n\r\nĐẶC ĐIỂM NỔI BẬT\r\n\r\n- Ngôi nhà được làm từ chất liệu cotton thông thoáng, dễ vệ sinh và phù hợp với khí hậu nóng ẩm ở Việt Nam.\r\n\r\n- Bề mặt nằm có lớp lót cotton êm cùng thiết kế hình ngôi nhà với 3 mặt bao quanh nhằm tạo cho thú cưng của bạn cảm giác được che chở an toàn và ấm áp.\r\n\r\n- Nhà cho thú cưng sử dụng gam màu nổi bật kết hợp với những đường kẻ sọc cá tính, đây chắc chắn sẽ là nơi thư giãn lý tưởng, làm hài lòng những chú cún con xinh xắn.\r\n\r\n- Kích thước : 40*40*45cm', 250000, 220000, '386_1_386_dem_angry_birds.jpg', 'cái', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Thức ăn', 'Nuôi thú cảnh là thực sự thú vui xa xỉ của những người có điều kiện khi giá của sản phẩm thức ăn nhập khẩu cho vật nuôi này hiện ở mức cao ngất ngưởng.', 'banh-man-thu-vi-nhat-1.jpg', NULL, NULL),
(2, 'Quần áo', 'Với Những bộ quần áo thú cưng thật đẹp và đầy cá tính, chúng tôi có thể giúp bé yêu của nhà bạn tỏa sáng.', '20131108144733.jpg', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'Dụng cụ vệ sinh', 'Bạn luôn muốn giữ vệ sinh cho thú cưng của bạn . Hãy đến với chúng tôi.!', 'banhtraicay.jpg', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'y tế & Thuốc', 'Để cho thú cưng nhà bạn được khỏe mạnh. Đây chính nhà thuốc phục vụ cho bạn.', 'banhkem.jpg', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Đồ chơi & Phụ kiện', 'Bnạ muốn thú cưng của bạn trở nên chuyên nghiệp. Có được những dụng cụ huấn luyện chuyên nghiệp .Hãy đến với chúng tôi.', 'crepe.jpg', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'Chuồng, giường, nhà, túi.', 'Một mái nhà nho nhỏ dành cho thú cưng của bạn . Hãy bắt đầu mua sắm đi nào', 'pizza.jpg', '2016-10-25 17:19:00', NULL),
(7, 'Khác ...', '...', 'sukemdau.jpg', '2016-10-25 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Hương Hương', 'huonghuong08.php@gmail.com', '$2y$10$rGY4KT6ZSMmLnxIbmTXrsu2xdgRxm8x0UTwCyYCAzrJ320kYheSRq', '23456789', 'Hoàng Diệu 2', NULL, '2017-03-23 07:17:33', '2017-03-23 07:17:33'),
(7, 'sad', 'hoangminh@gmail.com', '$2y$10$rDVbjZuN5jwO5zt0zbZ3eeJ/.YqE9GXCtuEIPgc671zElMDIj6k0G', '12312324', 'Street Address', NULL, '2019-06-10 16:51:55', '2019-06-10 16:51:55'),
(8, 'hoang minh', 'hoangminh12297@gmail.com', '$2y$10$dq8FsZdfggFQvG5FNnjRqeZNKBW1EPSu.ooXbEV94ithupVvka0Ym', '0346578452', 'linh dong', NULL, '2019-12-26 09:00:40', '2019-12-26 09:00:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
