--
-- Cơ sở dữ liệu: `ecomm`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `role`, `email`, `mobile`, `status`) VALUES
(1, 'admin', 'admin', 0, '', '', 1),
(2, 'amit', 'amit', 1, 'amit@gmail.com', '1234567890', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `heading1` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `heading2` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `btn_txt` varchar(255) DEFAULT NULL,
  `btn_link` varchar(55) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `order_no` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `heading1`, `heading2`, `btn_txt`, `btn_link`, `image`, `order_no`, `status`) VALUES
(1, 'Samsung Galaxy Z Flip 4', 'Flex Mode Collection', 'See Now', 'product.php?id=4', 'galaxybanner.jpg', 2, 1),
(2, '', '', '', '', 'asusbanner.png', 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'Mobile', 1),
(2, 'Laptop', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color_master`
--

CREATE TABLE `color_master` (
  `id` int(11) NOT NULL,
  `color` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `color_master`
--

INSERT INTO `color_master` (`id`, `color`, `status`) VALUES
(1, 'Đỏ', 1),
(3, 'Xanh', 1),
(4, 'Đen', 1),
(5, 'Trắng', 1),
(6, 'black', 1),
(7, 'blue', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `email` varchar(75) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `mobile` varchar(15) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `comment` text CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(8, 'Vương Quang Đại', 'vuongquangdai842002@gmail.com', '012345678', 'fix con gà mái', '2023-03-09 09:26:42'),
(9, 'Vương Quang Đại', 'vuongquangdai842002@gmail.com', '0123456789', 'con gà mái nè', '2023-03-09 03:29:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon_master`
--

CREATE TABLE `coupon_master` (
  `id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_type` varchar(10) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_value`, `coupon_type`, `cart_min_value`, `status`) VALUES
(3, 'hello', 30, 'Percentage', 200000, 1),
(4, 'oldfriend', 1000000, 'VND', 1000000, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `length` float NOT NULL,
  `breadth` float NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `txnid` varchar(200) NOT NULL,
  `mihpayid` varchar(200) NOT NULL,
  `ship_order_id` int(11) NOT NULL,
  `ship_shipment_id` int(11) NOT NULL,
  `payu_status` varchar(10) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_value` varchar(50) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `length`, `breadth`, `height`, `weight`, `txnid`, `mihpayid`, `ship_order_id`, `ship_shipment_id`, `payu_status`, `coupon_id`, `coupon_value`, `coupon_code`, `added_on`) VALUES
(12, 13, 'Xuân khánh, ninh kiều', 'Cần thơ', 890000, 'COD', 109529000, 'pending', 1, 0, 0, 0, 0, 'd13045fa5535899c1457', '', 0, 0, '', 3, '46941000', 'hello', '2023-03-09 03:59:39'),
(13, 13, 'Xuân khánh, ninh kiều', 'Cần thơ', 890000, 'COD', 19990000, 'pending', 1, 0, 0, 0, 0, 'f921253ca40fe585cce9', '', 0, 0, '', 4, '1000000', 'oldfriend', '2023-03-09 05:14:31'),
(14, 13, 'Xuân khánh, ninh kiều', 'Cần thơ', 890000, 'COD', 71736000, 'pending', 4, 5, 5, 5, 5, 'ad10ef786a3ebc84f6f6', '', 0, 0, '', 3, '30744000', 'hello', '2023-03-09 07:23:53'),
(15, 22, 'Xuân khánh, ninh kiều', 'Cần thơ', 980000, 'COD', 67186000, 'pending', 4, 0, 0, 0, 0, '0e0656980331f7cd90d5', '', 0, 0, '', 3, '28794000', 'hello', '2023-03-10 03:52:37'),
(16, 21, 'Xuân Khánh', 'Cần Thơ', 980000, 'COD', 34986000, 'pending', 3, 1, 1, 1, 1, 'da6feb6b0d726eb40cb0', '', 0, 0, '', 3, '14994000', 'hello', '2023-04-16 03:54:04'),
(17, 21, 'Xuân Khánh', 'Cần Thơ', 980000, 'COD', 48480000, 'pending', 1, 0, 0, 0, 0, 'b176ce5bd47c56d60cb9', '', 0, 0, '', 0, '', '', '2023-04-16 04:53:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_attr_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `product_attr_id`, `qty`, `price`) VALUES
(1, 1, 7, 5, 10, 333),
(2, 2, 2, 12, 3, 27490000),
(3, 3, 2, 12, 3, 27490000),
(4, 4, 2, 12, 3, 27490000),
(5, 5, 2, 12, 3, 27490000),
(6, 6, 2, 12, 3, 27490000),
(7, 7, 2, 12, 3, 27490000),
(8, 8, 2, 12, 3, 27490000),
(9, 9, 2, 12, 1, 27490000),
(10, 9, 3, 13, 1, 74990000),
(11, 10, 3, 13, 1, 74990000),
(12, 10, 2, 12, 1, 27490000),
(13, 11, 3, 13, 1, 74990000),
(14, 11, 2, 12, 1, 27490000),
(15, 12, 26, 22, 1, 74990000),
(16, 12, 2, 23, 1, 53990000),
(17, 12, 27, 24, 1, 27490000),
(18, 13, 28, 25, 1, 20990000),
(19, 14, 27, 24, 1, 27490000),
(20, 14, 26, 22, 1, 74990000),
(21, 15, 28, 25, 1, 20990000),
(22, 15, 26, 22, 1, 74990000),
(23, 16, 7, 30, 2, 24990000),
(24, 17, 6, 6, 1, 26990000),
(25, 17, 8, 32, 1, 21490000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `image3d` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `image3d_usdz` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `short_desc` varchar(2000) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `des_screen` text CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `des_cpu` text CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `des_ram` text CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `des_memory` text CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `des_graphics` text CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `des_weight` text CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `best_seller` int(11) NOT NULL,
  `meta_title` varchar(2000) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `meta_desc` varchar(2000) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `meta_keyword` varchar(2000) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `image3d`, `image3d_usdz`, `short_desc`, `description`, `des_screen`, `des_cpu`, `des_ram`, `des_memory`, `des_graphics`, `des_weight`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `added_by`, `status`) VALUES
(1, 2, 2, 'ASUS Zenbook Pro 14 Duo OLED UX8402', 56990000, 53990000, 100, 'ZenbookPro14DuoOLEDUX8402ZE.jpg', 'ZenbookPro14DuoOLEDUX8402ZE.gltf', 'ZenbookPro14DuoOLEDUX8402ZE.usdz', 'Ấn tượng khó tin bắt nguồn từ màn hình kép', 'Máy tính xách tay OLED 14,5’’ 2.8K 120 Hz với màn hình thứ hai đầu tiên trên thế giới. Xin giới thiệu sản phẩm Zenbook Pro 14 Duo OLED siêu mạnh mới, một cỗ máy đạt chứng nhận Intel® Evo™ cho phép bạn thỏa sức phát huy khả năng sáng tạo của mình. CPU Intel cao cấp và GPU NVIDIA® đẳng cấp sáng tạo chuyên nghiệp được tản nhiệt hiệu quả để đảm bảo hiệu năng đỉnh cao nhờ công nghệ ASUS IceCool Plus, cùng sự hỗ trợ từ cơ chế AAS Ultra hoàn toàn mới, cho phép thoát khí trong khung máy đồng thời nghiêng màn hình cảm ứng thứ hai ScreenPad™ Plus thế hệ mới tới một góc phù hợp để đem lại trải nghiệm xem đắm chìm và mượt mà nhất. Để có được màn hình đạt chuẩn studio, màn hình cảm ứng chính 2.8K OLED HDR 16:102 có tần số làm mới 120 Hz, độ chính xác màu chuẩn PANTONE® Validated và dải màu sắc DCI-P3 100% đẳng cấp điện ảnh. Zenbook Pro 14 Duo OLED bỏ xa mọi đối thủ, khiến sản phẩm này trở thành chiếc máy tính xách tay màn hình OLED nhỏ gọn tối thượng cho nhà sáng tạo am hiểu.', 'Chính: 14.5-inch, Tỷ lệ khung hình 16:10 2.8K OLED; Phụ: ScreenPad™ Plus (tấm nền IPS 12,7\")', 'Intel® Core™ i7-12700H 2,3 GHz', '16GB LPDDR5', 'SSD 1TB M.2 NVMe™ PCIe® 4.0', 'NVIDIA® GeForce® RTX™ 3050 Ti 4GB GDDR6', '1.75 kg', 1, 'ASUS Zenbook Pro 14 Duo OLED UX8402', 'Máy tính xách tay OLED 14,5’’ 2.8K 120 Hz với màn hình thứ hai đầu tiên trên thế giới. Xin giới thiệu sản phẩm Zenbook Pro 14 Duo OLED siêu mạnh mới, một cỗ máy đạt chứng nhận Intel® Evo™ cho phép bạn thỏa sức phát huy khả năng sáng tạo của mình. CPU Intel cao cấp và GPU NVIDIA® đẳng cấp sáng tạo chuyên nghiệp được tản nhiệt hiệu quả để đảm bảo hiệu năng đỉnh cao nhờ công nghệ ASUS IceCool Plus, cùng sự hỗ trợ từ cơ chế AAS Ultra hoàn toàn mới, cho phép thoát khí trong khung máy đồng thời nghiêng màn hình cảm ứng thứ hai ScreenPad™ Plus thế hệ mới tới một góc phù hợp để đem lại trải nghiệm xem đắm chìm và mượt mà nhất. Để có được màn hình đạt chuẩn studio, màn hình cảm ứng chính 2.8K OLED HDR 16:102 có tần số làm mới 120 Hz, độ chính xác màu chuẩn PANTONE® Validated và dải màu sắc DCI-P3 100% đẳng cấp điện ảnh. Zenbook Pro 14 Duo OLED bỏ xa mọi đối thủ, khiến sản phẩm này trở thành chiếc máy tính xách tay màn hình OLED nhỏ gọn tối thượng cho nhà sáng tạo am hiểu.', 'Máy tính xách tay OLED 14,5’’ 2.8K 120 Hz với màn hình thứ hai đầu tiên trên thế giới. Xin giới thiệu sản phẩm Zenbook Pro 14 Duo OLED siêu mạnh mới, một cỗ máy đạt chứng nhận Intel® Evo™ cho phép bạn thỏa sức phát huy khả năng sáng tạo của mình. CPU Intel cao cấp và GPU NVIDIA® đẳng cấp sáng tạo chuyên nghiệp được tản nhiệt hiệu quả để đảm bảo hiệu năng đỉnh cao nhờ công nghệ ASUS IceCool Plus, cùng sự hỗ trợ từ cơ chế AAS Ultra hoàn toàn mới, cho phép thoát khí trong khung máy đồng thời nghiêng màn hình cảm ứng thứ hai ScreenPad™ Plus thế hệ mới tới một góc phù hợp để đem lại trải nghiệm xem đắm chìm và mượt mà nhất. Để có được màn hình đạt chuẩn studio, màn hình cảm ứng chính 2.8K OLED HDR 16:102 có tần số làm mới 120 Hz, độ chính xác màu chuẩn PANTONE® Validated và dải màu sắc DCI-P3 100% đẳng cấp điện ảnh. Zenbook Pro 14 Duo OLED bỏ xa mọi đối thủ, khiến sản phẩm này trở thành chiếc máy tính xách tay màn hình OLED nhỏ gọn tối thượng cho nhà sáng tạo am hiểu.', 0, 1),
(2, 2, 2, 'ProArt Studiobook Pro 16 OLED W7600', 82490000, 74990000, 100, 'ProArtStudiobookPro16OLEDW7600.png', 'ProArtStudiobookPro16OLEDW7600.gltf', 'ProArtStudiobookPro16OLEDW7600.usdz', 'Được thiết kế cho các chuyên gia sáng tạo', 'Biến ý tưởng sáng tạo của bạn thành hiện thực với máy tính xách tay ProArt Studiobook Pro 16 OLED: thúc đẩy mọi giới hạn để đem lại cho bạn trải nghiệm sáng tạo dễ dàng mà bạn luôn mong mỏi nhưng chưa bao giờ nghĩ rằng có thể sở hữu. Với màn hình HDR OLED 16 inch IPS 3.2K 120 Hz hoặc 4K 60 Hz 16:10 đạt chứng nhận về độ chính xác màu, bộ vi xử lý lên tới Intel® Core™ i9 đột phá, đồ họa NVIDIA GeForce RTX™ A3000 12 GB đẳng cấp chuyên nghiệp, dung lượng bộ nhớ lớn, ổ lưu trữ siêu nhanh cao cấp, chuẩn kết nối I/O tiện lợi và khả năng điều khiển bằng ngón tay siêu chính xác với các ứng dụng sáng tạo nhờ ASUS Dial mới, ProArt Studiobook Pro 16 OLED đơn giản chính là chiếc máy tính xách tay dành cho chuyên gia sáng tạo tuyệt vời nhất chúng tôi từng tạo nên.', '16,0 inch, Tỷ lệ khung hình OLED 16:10 4K (3840 x 2400)', 'Intel® Core™ i9-12900H 2,5 GHz', '32GB DDR5 SO-DIMM', 'SSD 1TB', 'NVIDIA® RTX™ A3000 12GB', '2.4 kg', 0, 'ProArt Studiobook Pro 16 OLED W7600', 'Biến ý tưởng sáng tạo của bạn thành hiện thực với máy tính xách tay ProArt Studiobook Pro 16 OLED: thúc đẩy mọi giới hạn để đem lại cho bạn trải nghiệm sáng tạo dễ dàng mà bạn luôn mong mỏi nhưng chưa bao giờ nghĩ rằng có thể sở hữu. Với màn hình HDR OLED 16 inch IPS 3.2K 120 Hz hoặc 4K 60 Hz 16:10 đạt chứng nhận về độ chính xác màu, bộ vi xử lý lên tới Intel® Core™ i9 đột phá, đồ họa NVIDIA GeForce RTX™ A3000 12 GB đẳng cấp chuyên nghiệp, dung lượng bộ nhớ lớn, ổ lưu trữ siêu nhanh cao cấp, chuẩn kết nối I/O tiện lợi và khả năng điều khiển bằng ngón tay siêu chính xác với các ứng dụng sáng tạo nhờ ASUS Dial mới, ProArt Studiobook Pro 16 OLED đơn giản chính là chiếc máy tính xách tay dành cho chuyên gia sáng tạo tuyệt vời nhất chúng tôi từng tạo nên.', 'Biến ý tưởng sáng tạo của bạn thành hiện thực với máy tính xách tay ProArt Studiobook Pro 16 OLED: thúc đẩy mọi giới hạn để đem lại cho bạn trải nghiệm sáng tạo dễ dàng mà bạn luôn mong mỏi nhưng chưa bao giờ nghĩ rằng có thể sở hữu. Với màn hình HDR OLED 16 inch IPS 3.2K 120 Hz hoặc 4K 60 Hz 16:10 đạt chứng nhận về độ chính xác màu, bộ vi xử lý lên tới Intel® Core™ i9 đột phá, đồ họa NVIDIA GeForce RTX™ A3000 12 GB đẳng cấp chuyên nghiệp, dung lượng bộ nhớ lớn, ổ lưu trữ siêu nhanh cao cấp, chuẩn kết nối I/O tiện lợi và khả năng điều khiển bằng ngón tay siêu chính xác với các ứng dụng sáng tạo nhờ ASUS Dial mới, ProArt Studiobook Pro 16 OLED đơn giản chính là chiếc máy tính xách tay dành cho chuyên gia sáng tạo tuyệt vời nhất chúng tôi từng tạo nên.', 1, 1),
(3, 2, 1, 'MacBook Air M2 2022 13 inch 8CPU 8GPU 8GB', 32990000, 27490000, 100, 'MacBookAirM2202213inch8CPU8GPU8GB.png', 'MacBookAirM2202213inch8CPU8GPU8GB.glb', 'MacBookAirM2202213inch8CPU8GPU8GB.usdz', 'Mỏng, nhẹ và đầy cảm hứng', 'Không chỉ khơi gợi cảm hứng qua việc cách tân thiết kế, MacBook Air M2 2022 còn chứa đựng nguồn sức mạnh lớn lao với chip M2 siêu mạnh, thời lượng pin chạm  ngưỡng 18 giờ, màn hình Liquid Retina tuyệt đẹp và hệ thống camera kết hợp cùng âm thanh tân tiến.', '13.6 inch, 2560 x 1644 Pixels, IPS, 60 Hz, 500 nits, Liquid Retina', 'Apple, M2, 8 - Core', '8 GB, LPDDR4, 3200 MHz', 'SSD 256 GB', 'Apple M2 GPU 8 nhân', '1.24 kg', 0, 'MacBook Air M2 2022', 'Không chỉ khơi gợi cảm hứng qua việc cách tân thiết kế, MacBook Air M2 2022 còn chứa đựng nguồn sức mạnh lớn lao với chip M2 siêu mạnh, thời lượng pin chạm  ngưỡng 18 giờ, màn hình Liquid Retina tuyệt đẹp và hệ thống camera kết hợp cùng âm thanh tân tiến.', 'Không chỉ khơi gợi cảm hứng qua việc cách tân thiết kế, MacBook Air M2 2022 còn chứa đựng nguồn sức mạnh lớn lao với chip M2 siêu mạnh, thời lượng pin chạm  ngưỡng 18 giờ, màn hình Liquid Retina tuyệt đẹp và hệ thống camera kết hợp cùng âm thanh tân tiến.', 1, 1),
(4, 1, 5, 'Samsung Galaxy Z Flip4 5G Flex Mode Collection', 25990000, 20990000, 100, 'SamsungGalaxyZFlip4.png', 'SamsungGalaxyZFlip4.glb', 'SamsungGalaxyZFlip4.usdz', 'Flex Mode Collection', 'Linh hoạt biến hóa, không ngừng sáng tạo, Samsung Galaxy Z Flip4 mang đến những xu hướng công nghệ hiện đại, đậm chất thời trang cho người dùng sành điệu. Nay điện thoại còn thêm phần cuốn hút với phiên bản giới hạn Samsung Galaxy Z Flip4 Flex Mode Collection – một sự kết hợp của Samsung và GIA STUDIOS', 'Chính: 6.7 inch, Phụ: 1.9 inch, Dynamic AMOLED, FHD+, 1080 x 2636 Pixels', 'Snapdragon 8+ Gen 1', '8 GB LPDDR5', '256 GB', 'Onboard', '183 g', 1, 'Samsung Galaxy Z Flip4 5G', 'Linh hoạt biến hóa, không ngừng sáng tạo, Samsung Galaxy Z Flip4 mang đến những xu hướng công nghệ hiện đại, đậm chất thời trang cho người dùng sành điệu. Nay điện thoại còn thêm phần cuốn hút với phiên bản giới hạn Samsung Galaxy Z Flip4 Flex Mode Collection – một sự kết hợp của Samsung và GIA STUDIOS', 'Linh hoạt biến hóa, không ngừng sáng tạo, Samsung Galaxy Z Flip4 mang đến những xu hướng công nghệ hiện đại, đậm chất thời trang cho người dùng sành điệu. Nay điện thoại còn thêm phần cuốn hút với phiên bản giới hạn Samsung Galaxy Z Flip4 Flex Mode Collection – một sự kết hợp của Samsung và GIA STUDIOS', 1, 1),
(5, 2, 1, 'MacBook Pro 2021 M1 Pro 16 inch 1TB', 70990000, 57990000, 100, 'MacBook_Pro_16_2021_M1_Pro.png', 'apple_macbook_pro_16_inch_2021.glb', 'apple_macbook_pro_16_inch_2021.usdz', 'Thiết kế đẳng cấp và thời thượng', 'Dành cho những người chuyên nghiệp, MacBook Pro 16 inch 2021 mang đến hiệu suất mạnh mẽ nằm ngoài trí tưởng tượng của bạn với bộ vi xử lý M1 Pro đột phá. Bạn sẽ được làm việc trên màn hình lớn 16 inch Liquid Retina XDR siêu nét, đầy đủ cổng kết nối và thời lượng pin lên tới hơn 20 giờ.', '16.2 inch, 3456 x 2234 Pixels', 'Apple M1 Pro', '16 GB', 'SSD 1 TB', 'Apple M1', '2.129 kg', 0, 'MacBook Pro 16\" 2021 M1 Pro 1TB', 'Dành cho những người chuyên nghiệp, MacBook Pro 16 inch 2021 mang đến hiệu suất mạnh mẽ nằm ngoài trí tưởng tượng của bạn với bộ vi xử lý M1 Pro đột phá. Bạn sẽ được làm việc trên màn hình lớn 16 inch Liquid Retina XDR siêu nét, đầy đủ cổng kết nối và thời lượng pin lên tới hơn 20 giờ.', 'Dành cho những người chuyên nghiệp, MacBook Pro 16 inch 2021 mang đến hiệu suất mạnh mẽ nằm ngoài trí tưởng tượng của bạn với bộ vi xử lý M1 Pro đột phá. Bạn sẽ được làm việc trên màn hình lớn 16 inch Liquid Retina XDR siêu nét, đầy đủ cổng kết nối và thời lượng pin lên tới hơn 20 giờ.', 1, 1),
(6, 1, 6, 'iPhone 13 Pro Max 256GB', 36990000, 26990000, 100, 'iPhone 13 Promax.png', 'apple_iphone_13_pro_max.glb', 'Apple_iPhone_13_Pro_Max.usdz', 'Đẳng cấp, mạnh mẽ và thời thượng', 'iPhone 13 Pro Max xứng đáng là một chiếc iPhone lớn nhất, mạnh mẽ nhất và có thời lượng pin dài nhất từ trước đến nay sẽ cho bạn trải nghiệm tuyệt vời, từ những tác vụ bình thường cho đến các ứng dụng chuyên nghiệp. Màn hình chất lượng hàng đầu thế giới smartphone với tấm nền OLED tuyệt đẹp, công nghệ Super Retina XDR siêu nét và độ sáng tối đa đạt mức khó tin, lên tới 1200 nits cho nội dung HDR. Dung lượng pin lớn hơn, màn hình mới và bộ vi xử lý Apple A15 Bionic tiết kiệm điện hơn giúp nó trở thành chiếc iPhone có thời lượng pin tốt nhất từ trước đến nay.', '6.7 inch, OLED, Super Retina XDR, 2778 x 1284 Pixels', 'Apple A15 Bionic', '6 GB', '256GB', 'Apple GPU 5 nhân', '240g', 0, 'iPhone 13 Pro Max 256GB', 'iPhone 13 Pro Max xứng đáng là một chiếc iPhone lớn nhất, mạnh mẽ nhất và có thời lượng pin dài nhất từ trước đến nay sẽ cho bạn trải nghiệm tuyệt vời, từ những tác vụ bình thường cho đến các ứng dụng chuyên nghiệp. Màn hình chất lượng hàng đầu thế giới smartphone với tấm nền OLED tuyệt đẹp, công nghệ Super Retina XDR siêu nét và độ sáng tối đa đạt mức khó tin, lên tới 1200 nits cho nội dung HDR. Dung lượng pin lớn hơn, màn hình mới và bộ vi xử lý Apple A15 Bionic tiết kiệm điện hơn giúp nó trở thành chiếc iPhone có thời lượng pin tốt nhất từ trước đến nay.', 'iPhone 13 Pro Max xứng đáng là một chiếc iPhone lớn nhất, mạnh mẽ nhất và có thời lượng pin dài nhất từ trước đến nay sẽ cho bạn trải nghiệm tuyệt vời, từ những tác vụ bình thường cho đến các ứng dụng chuyên nghiệp. Màn hình chất lượng hàng đầu thế giới smartphone với tấm nền OLED tuyệt đẹp, công nghệ Super Retina XDR siêu nét và độ sáng tối đa đạt mức khó tin, lên tới 1200 nits cho nội dung HDR. Dung lượng pin lớn hơn, màn hình mới và bộ vi xử lý Apple A15 Bionic tiết kiệm điện hơn giúp nó trở thành chiếc iPhone có thời lượng pin tốt nhất từ trước đến nay.', 1, 1),
(7, 2, 2, 'ASUS Zenbook S 13 OLED UM5302', 29990000, 24990000, 100, 'Zen_UM5302_Laptop_Bezel_Blue.png', 'Zen_UM5302_Laptop_Bezel_Blue.gltf', 'Zen_UM5302_Laptop_Bezel_Blue.usdz', 'Kiệt tác song toàn - Nhẹ thăng hoa - Nội lực bản lĩnh', 'Zenbook S 13 OLED siêu nhẹ2 chỉ 1 kg sẽ là người bạn đồng hành mạnh mẽ và thanh lịch cho những cá nhân có phong cách sống bận rộn. Máy được trang bị nhiều công nghệ cao cấp bên trong bộ khung bằng hợp kim nhôm-magiê siêu mỏng chỉ 14,9mm gồm có bộ vi xử lý AMD Ryzen™ 6000-Series và đồ họa AMD Radeon™. Lớp hoàn thiện với bốn gam màu mới đầy tinh tế —Xanh lam trầm, Men ngọc bích, Be cổ điển và Trắng tinh khôi — Zenbook S 13 OLED được thiết kế để nổi bật nhưng có thể dễ dàng mang theo đi bất cứ đâu. Đôi mắt — và những ngón tay — của bạn sẽ thích thú với độ rõ nét và khả năng đáp ứng của màn hình cảm ứng 16:10 13,3 inch 2.8K OLED NanoEdge3,4,5, đạt chứng nhận Dolby Vision với màu sắc siêu sống động cho trải nghiệm xem tuyệt vời. Và đôi tai bạn sẽ được chiêu đãi âm thanh đa chiều đắm chìm từ hệ thống âm thanh Dolby Atmos. Sự thanh lịch được khẳng định trên chiếc máy này.', '13,3 inch, Tỷ lệ 16:10 2.8K (2880 x 1800) OLED', 'AMD Ryzen™ 5 6600U', '8GB LPDDR5', 'SSD 512GB M.2 NVMe™ PCIe®', 'AMD Radeon™', '1.10 kg', 0, 'ASUS Zenbook S 13 OLED UM5302', 'Zenbook S 13 OLED siêu nhẹ2 chỉ 1 kg sẽ là người bạn đồng hành mạnh mẽ và thanh lịch cho những cá nhân có phong cách sống bận rộn. Máy được trang bị nhiều công nghệ cao cấp bên trong bộ khung bằng hợp kim nhôm-magiê siêu mỏng chỉ 14,9mm gồm có bộ vi xử lý AMD Ryzen™ 6000-Series và đồ họa AMD Radeon™. Lớp hoàn thiện với bốn gam màu mới đầy tinh tế —Xanh lam trầm, Men ngọc bích, Be cổ điển và Trắng tinh khôi — Zenbook S 13 OLED được thiết kế để nổi bật nhưng có thể dễ dàng mang theo đi bất cứ đâu. Đôi mắt — và những ngón tay — của bạn sẽ thích thú với độ rõ nét và khả năng đáp ứng của màn hình cảm ứng 16:10 13,3 inch 2.8K OLED NanoEdge3,4,5, đạt chứng nhận Dolby Vision với màu sắc siêu sống động cho trải nghiệm xem tuyệt vời. Và đôi tai bạn sẽ được chiêu đãi âm thanh đa chiều đắm chìm từ hệ thống âm thanh Dolby Atmos. Sự thanh lịch được khẳng định trên chiếc máy này. Kiệt tác song toàn - Nhẹ thăng hoa - Nội lực bản lĩnh, 13.3 Tỷ lệ 16:10 2.8K 2,8K (2880 x 1800) OLED AMD Ryzen™ 5 6600U 8GB LPDDR5 SSD 512GB M.2 NVMe™ PCIe® AMD Radeon™ 1.10 kg', 'Zenbook S 13 OLED siêu nhẹ2 chỉ 1 kg sẽ là người bạn đồng hành mạnh mẽ và thanh lịch cho những cá nhân có phong cách sống bận rộn. Máy được trang bị nhiều công nghệ cao cấp bên trong bộ khung bằng hợp kim nhôm-magiê siêu mỏng chỉ 14,9mm gồm có bộ vi xử lý AMD Ryzen™ 6000-Series và đồ họa AMD Radeon™. Lớp hoàn thiện với bốn gam màu mới đầy tinh tế —Xanh lam trầm, Men ngọc bích, Be cổ điển và Trắng tinh khôi — Zenbook S 13 OLED được thiết kế để nổi bật nhưng có thể dễ dàng mang theo đi bất cứ đâu. Đôi mắt — và những ngón tay — của bạn sẽ thích thú với độ rõ nét và khả năng đáp ứng của màn hình cảm ứng 16:10 13,3 inch 2.8K OLED NanoEdge3,4,5, đạt chứng nhận Dolby Vision với màu sắc siêu sống động cho trải nghiệm xem tuyệt vời. Và đôi tai bạn sẽ được chiêu đãi âm thanh đa chiều đắm chìm từ hệ thống âm thanh Dolby Atmos. Sự thanh lịch được khẳng định trên chiếc máy này. Kiệt tác song toàn - Nhẹ thăng hoa - Nội lực bản lĩnh, 13.3 Tỷ lệ 16:10 2.8K 2,8K (2880 x 1800) OLED AMD Ryzen™ 5 6600U 8GB LPDDR5 SSD 512GB M.2 NVMe™ PCIe® AMD Radeon™ 1.10 kg', 0, 1),
(8, 1, 5, 'Samsung Galaxy S22 Ultra 12GB 256GB', 33990000, 21490000, 100, 'Samsung_galaxy_s22ultra.png', 'samsung_galaxy_s22_ultra.glb', 'Samsung_Galaxy_S22_Ultra.usdz', 'Sức mạnh vô song đỉnh cao', 'Samsung Galaxy S22 Ultra 5G là siêu phẩm kế thừa tinh hoa Galaxy Note cùng đột phá Galaxy S, tạo nên sức mạnh vô song đỉnh cao. Điện thoại đã thiết lập chuẩn mực mới cho dòng smartphone cao cấp từ sức mạnh hàng đầu Snapdragon 8 Gen 1, camera “mắt thần bóng đêm”, khả năng zoom 100x, bút S-Pen tích hợp và thời gian sử dụng cả ngày dài. Đây là siêu phẩm tuyệt vời nhất mà Samsung từng mang đến.', '6.8 inch, Dynamic AMOLED 2X, QHD+, 1440 x 3088 Pixels', 'Snapdragon 8 Gen 1', '12 GB', '256 GB', 'none', '189 g', 0, 'Samsung Galaxy S22 Ultra 12GB 256GB', 'Samsung Galaxy S22 Ultra 5G là siêu phẩm kế thừa tinh hoa Galaxy Note cùng đột phá Galaxy S, tạo nên sức mạnh vô song đỉnh cao. Điện thoại đã thiết lập chuẩn mực mới cho dòng smartphone cao cấp từ sức mạnh hàng đầu Snapdragon 8 Gen 1, camera “mắt thần bóng đêm”, khả năng zoom 100x, bút S-Pen tích hợp và thời gian sử dụng cả ngày dài. Đây là siêu phẩm tuyệt vời nhất mà Samsung từng mang đến. 6.8 inch, Dynamic AMOLED 2X, QHD+, 1440 x 3088 Pixels Snapdragon 8 Gen 1 12 GB 256 GB 189 g Samsung Galaxy S22 Ultra 12GB 256GB', 'Samsung Galaxy S22 Ultra 5G là siêu phẩm kế thừa tinh hoa Galaxy Note cùng đột phá Galaxy S, tạo nên sức mạnh vô song đỉnh cao. Điện thoại đã thiết lập chuẩn mực mới cho dòng smartphone cao cấp từ sức mạnh hàng đầu Snapdragon 8 Gen 1, camera “mắt thần bóng đêm”, khả năng zoom 100x, bút S-Pen tích hợp và thời gian sử dụng cả ngày dài. Đây là siêu phẩm tuyệt vời nhất mà Samsung từng mang đến. 6.8 inch, Dynamic AMOLED 2X, QHD+, 1440 x 3088 Pixels Snapdragon 8 Gen 1 12 GB 256 GB 189 g Samsung Galaxy S22 Ultra 12GB 256GB', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `mrp` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `size_id`, `color_id`, `mrp`, `price`, `qty`) VALUES
(1, 1, 0, 0, 56990000, 53990000, 100),
(2, 2, 0, 0, 82490000, 74990000, 100),
(3, 3, 0, 0, 32990000, 27490000, 100),
(4, 4, 0, 0, 25990000, 20990000, 100),
(5, 5, 0, 0, 70990000, 57990000, 100),
(6, 6, 0, 0, 36990000, 26990000, 100),
(30, 7, 0, 0, 29990000, 24990000, 100),
(31, 31, 0, 0, 33990000, 21490000, 100),
(32, 8, 0, 0, 33990000, 21490000, 100);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_images` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `product_images`) VALUES
(18, 2, 'ZENBOOK PRO 14 DUO OLED UX8402ZE.png'),
(19, 2, 'ZENBOOK PRO 14 DUO OLED UX8402ZE(1).png'),
(20, 2, 'ZENBOOK PRO 14 DUO OLED UX8402ZE(2).png'),
(21, 2, 'ZENBOOK PRO 14 DUO OLED UX8402ZE(3).png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` varchar(20) NOT NULL,
  `review` text CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_review`
--

INSERT INTO `product_review` (`id`, `product_id`, `user_id`, `rating`, `review`, `status`, `added_on`) VALUES
(2, 9, 1, 'Good', 'good', 1, '2023-03-01 08:31:39'),
(8, 28, 22, 'Very Good', 'good', 1, '2023-03-10 03:59:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shiprocket_token`
--

CREATE TABLE `shiprocket_token` (
  `id` int(11) NOT NULL,
  `token` varchar(500) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `shiprocket_token`
--

INSERT INTO `shiprocket_token` (`id`, `token`, `added_on`) VALUES
(1, '', '2023-03-01 00:28:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size_master`
--

CREATE TABLE `size_master` (
  `id` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `order_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `size_master`
--

INSERT INTO `size_master` (`id`, `size`, `status`, `order_by`) VALUES
(1, '128GB', 1, 3),
(2, '256GB', 1, 4),
(4, '512GB', 1, 2),
(5, '1TB', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(1, 2, 'Macbook', 1),
(2, 2, 'Asus', 1),
(5, 1, 'Samsung', 1),
(6, 1, 'Iphone', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(21, 'Đại', '1234', 'vuongquangdai842002@gmail.com', '', '2023-03-10 02:38:20'),
(22, 'anh', '1234', 'bilunvui1@gmail.com', '', '2023-03-10 03:47:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(1, 1, 12, '2023-03-01 01:53:31'),
(2, 2, 7, '2023-03-02 07:38:54'),
(5, 13, 28, '2023-03-09 12:58:27');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `color_master`
--
ALTER TABLE `color_master`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupon_master`
--
ALTER TABLE `coupon_master`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `size_master`
--
ALTER TABLE `size_master`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `color_master`
--
ALTER TABLE `color_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `coupon_master`
--
ALTER TABLE `coupon_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `shiprocket_token`
--
ALTER TABLE `shiprocket_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `size_master`
--
ALTER TABLE `size_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
