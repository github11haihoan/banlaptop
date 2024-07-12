-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 07, 2023 lúc 08:15 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doanlaravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(19, '2014_10_12_000000_create_users_table', 1),
(20, '2014_10_12_100000_create_password_resets_table', 1),
(21, '2019_06_11_145812_create_tbl_admin_table', 1),
(22, '2019_06_17_161852_create_tbl_category_product', 1),
(23, '2019_06_19_152045_create_tbl_brand_product', 1),
(24, '2019_06_19_155204_create_tbl_product', 1),
(25, '2019_08_17_030852_tbl_customer', 1),
(26, '2019_08_17_044054_tbl_shipping', 2),
(30, '2019_08_28_142718_tbl_payment', 3),
(31, '2019_08_28_142750_tbl_order', 3),
(32, '2019_08_28_142810_tbl_order_details', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'haihoan', '0367102337', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `brand_slug`, `brand_desc`, `brand_status`, `created_at`, `updated_at`) VALUES
(4, 'Asus', 'A-s-u-s', 'Chưa một lần rời khỏi Top các hãng laptop tốt nhất, Asus trong năm 2020 được nhận xét đã mang đến nhiều đột phá về công nghệ lẫn thiết kế. \r\n\r\nTrong suốt nhiều thập kỷ, Asus đã tạo nên hệ sinh thái máy tính xách tay với đa dạng mọi phân khúc tiêu dùng. Các dòng máy Asus đáp ứng từ người dùng bình thường đến người dùng cần nhiều tính chuyên môn hơn như: công việc văn phòng, sáng tạo hay chơi game.', 0, NULL, NULL),
(5, 'DELL', 'D-E-L-L', 'Sít sao ngay Asus, á quân các hãng laptop tốt 2020 không phải là một thương hiệu xa lạ. Một trong các hãng laptop của Mỹ – Dell. Trên thực tế, cả 2 thương hiệu này dường như ngầm được xem là bộ đôi không đội trời chung trong giới công nghệ. \r\n\r\nKhá trái với Asus, Dell có vẻ tập trung công nghệ vào các sản phẩm cốt lõi của mình thay vì liên tục tạo ra các dòng sản phẩm mới.', 0, NULL, NULL),
(6, 'HP', 'H-P', 'Ngôi vương các hãng laptop đã thuộc về HP. Bạn không nghe lầm đâu, HP chính là thương hiệu máy tính xách tay đã chiến thắng trong cuộc bầu chọn hồi 2019. Để so sánh với á quân năm nay và các hãng laptop tốt khác, có vẻ như cựu nhà vua đã ngủ quên trong chiến thắng.', 0, NULL, NULL),
(7, 'MSI', 'M-S-I', 'Không được truyền thông ưu ái tại Việt Nam, tuy nhiên cùng với Asus, MSI là một trong các hãng laptop tốt nhất hiện nay có nguồn gốc từ Đài Loan. Tuổi đời MSI cũng phải khiến các thành viên khác trong bảng xếp hạng các hãng laptop kính nể.\r\n\r\nĐứng ở vị trí không quá cao trong bảng xếp hạng, giữa vô số các thiết kế mỏng nhẹ, tinh tế và sang trọng, MSI nổi bật với các dòng máy có vẻ ngoài hầm hố, bắt mắt.', 0, NULL, NULL),
(9, 'ACER', 'ACER', 'Đài Loan có vẻ như là nguồn gốc của hầu hết các hãng laptop nổi tiếng và Acer là một trong số đó. Mặc dù vậy, 2020 hình như không phải là một năm thuận lợi của “đứa con của bán đảo phồn hoa” này. Acer trong năm 2020 là một minh chứng rõ ràng cho câu “dã tràng xe cát biển đông”. \r\n\r\nĐược đánh giá điểm gần như là tuyệt đối cho sự đổi mới, Acer xứng đáng có một vị trí cao hơn với tiến bộ vượt bậc trong dòng máy tính xách tay có cấu hình mạnh mẽ.', 1, NULL, NULL),
(10, 'RAZER', 'RAZER', 'Nhìn thì có vẻ đồng hạng với Lenovo nhưng Razer lại là thương hiệu máy tính nằm ở một đẳng cấp khác so với hầu hết các hãng laptop trong bảng xếp hạng này.', 1, NULL, NULL),
(11, 'APPLE', 'APPLE', 'Một trong những cú shock của fan nhà Táo chính là thương hiệu nghe có vẻ sẽ đứng trên các hãng laptop khác, lại đứng áp chót trong bảng xếp hạng của Laptopmag.', 0, NULL, NULL),
(12, 'MICROSOFT', 'M-I-C-R-O-S-O-F-T', 'Theo dòng chảy của xu hướng đa dạng hóa sản phẩm phục vụ các nhu cầu chuyên  biệt hơn, các hãng laptop có tuổi đời như Microsoft vẫn giữ nguyên các bước đi chậm rãi của mình.\r\n\r\nSản phẩm của hãng hầu như không đa dạng, cũng không thấy có chiến lược cho ra mắt sản phẩm mới một cách “đàng hoàng”.', 1, NULL, NULL),
(13, 'GIGABYTE', 'G-I-G-A-B-Y-T-E', 'Xa lạ với hầu hết người dùng mới bắt đầu có nhu cầu về laptop nhưng đối với dân sành công nghệ, Gigabyte cũng là một “gà chiến” trong trận chiến các hãng laptop hàng đầu với chất lượng không phải bàn cãi.\r\n\r\nCác dòng sản phẩm của Gigabyte chủ yếu được chia làm 3 phân khúc phục vụ nhu cầu chơi game và công việc sáng tạo. Do đó, nội tại của sản phẩm sở hữu công nghệ cực khủng để xử lý lượng công việc lớn.', 1, NULL, NULL),
(14, 'LG', 'LG', 'Càng về cuối, các thương hiệu laptop càng trở nên không mấy quen thuộc. LG từ lâu đã không còn mặn mòi để cạnh tranh ở phân khúc máy tính. Không chú tâm, không đồng nghĩa với việc laptop LG là một lựa chọn tồi.', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_category_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `slug_category_product`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(7, 'Laptop Gaming', 'Lap-top-gaming', 'Chỉ những laptop có cấu hình cao', 0, NULL, NULL),
(8, 'Laptop văn phòng', 'Lap-top-van-phong', 'Chỉ dành có laptopcos cấu hình trung bình', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_customers`
--

INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_phone`, `created_at`, `updated_at`) VALUES
(5, 'Nguyễn hải hoan', 'hoankk3321@gmail.com', '202cb962ac59075b964b07152d234b70', '0367102337', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_total` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(44, 5, 17, 46, '76,919,700.00', 'Đang chờ xử lý', NULL, NULL),
(45, 5, 18, 47, '66,767,800.00', 'Đang chờ xử lý', NULL, NULL),
(46, 5, 18, 48, '0.00', 'Đang chờ xử lý', NULL, NULL),
(47, 5, 18, 49, '0.00', 'Đang chờ xử lý', NULL, NULL),
(48, 5, 19, 50, '44,503,800.00', 'Đang chờ xử lý', NULL, NULL),
(49, 5, 20, 51, '76,919,700.00', 'Đang chờ xử lý', NULL, NULL),
(50, 5, 21, 52, '100,151,700.00', 'Đang chờ xử lý', NULL, NULL),
(51, 5, 22, 53, '33,383,900.00', 'Đang chờ xử lý', NULL, NULL),
(52, 5, 22, 54, '0.00', 'Đang chờ xử lý', NULL, NULL),
(53, 5, 23, 55, '333,839,000.00', 'Đang chờ xử lý', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `created_at`, `updated_at`) VALUES
(18, 44, 16, 'Laptop Asus Vivobook 14X OLED S3405VA-KM072W Đen (Cpu i5-13500H, Ram 16GB DDR4, SSD 512GB, Vga Xe Graphics, 14 inch OLED, Win 11 Home)', '21190000', 3, NULL, NULL),
(19, 45, 23, 'Macbook Air M2 2022', '27590000', 2, NULL, NULL),
(20, 48, 22, 'Laptop Apple MacBook Air 13 inch M1 2020 8-core CPU/8GB/256GB/7-core GPU (MGN63SA/A)', '18390000', 2, NULL, NULL),
(21, 49, 16, 'Laptop Asus Vivobook 14X OLED S3405VA-KM072W Đen (Cpu i5-13500H, Ram 16GB DDR4, SSD 512GB, Vga Xe Graphics, 14 inch OLED, Win 11 Home)', '21190000', 3, NULL, NULL),
(22, 50, 23, 'Macbook Air M2 2022', '27590000', 3, NULL, NULL),
(23, 51, 23, 'Macbook Air M2 2022', '27590000', 1, NULL, NULL),
(24, 53, 23, 'Macbook Air M2 2022', '27590000', 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(46, '2', 'Đang chờ xử lý', NULL, NULL),
(47, '2', 'Đang chờ xử lý', NULL, NULL),
(48, '2', 'Đang chờ xử lý', NULL, NULL),
(49, '2', 'Đang chờ xử lý', NULL, NULL),
(50, '2', 'Đang chờ xử lý', NULL, NULL),
(51, '2', 'Đang chờ xử lý', NULL, NULL),
(52, '2', 'Đang chờ xử lý', NULL, NULL),
(53, '2', 'Đang chờ xử lý', NULL, NULL),
(54, '2', 'Đang chờ xử lý', NULL, NULL),
(55, '1', 'Đang chờ xử lý', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `product_slug`, `category_id`, `brand_id`, `product_desc`, `product_content`, `product_price`, `product_image`, `product_status`, `created_at`, `updated_at`) VALUES
(15, 'Laptop Asus ROG Strix G17 G713RM-LL016W Gray (Cpu R7-6800H, Ram 16GB, SSD 512GB, Vga RTX 3060 6GB, 17.3 inch WQHD, Win 11 Home)', 'Asus ROG', 7, 4, '- CPU: AMD Ryzen 7-6800H\r\n- RAM/ SSD: 16GB DDR5 / 512GB SSD\r\n- VGA : NVIDIA GeForce RTX 3060 6GB GDDR6\r\n- Màn hình: 17.3 Inch WQHD\r\n- Hệ điều hành: Windows 11 Home\r\n- Màu sắc/ Chất liệu: Xám', 'Laptop Asus ROG Strix G17 G713RM-LL016W\r\nMàn hình 17.3\'\' - Hiệu năng mạnh mẽ - Tần số quét 240Hz \r\nASUS là một trong những hãng sản xuất Laptop nổi tiếng hàng đầu thế giới. Đến nay Asus đã tạo ra rất nhiều sản phẩm có cấu hình mạnh mẽ, vẻ ngoài sang trọng và phù hợp với nhiều phân khúc khách hàng, vì vậy Laptop ASUS đang rất được ưa chuộng hiện nay.\r\n\r\nLaptop Asus ROG Strix G17 G713RM-LL016W được thiết kế mạnh mẽ, chắc chắn, cấu hình cực khủng đang là mẫu laptop được ưa chuộng và yêu thích nhất hiện tại của nhà Asus', '37900000', '24335_laptop_asus_rog_strix_g17_g713rm_ll016w5.jpg', 0, NULL, NULL),
(16, 'Laptop Asus Vivobook 14X OLED S3405VA-KM072W Đen (Cpu i5-13500H, Ram 16GB DDR4, SSD 512GB, Vga Xe Graphics, 14 inch OLED, Win 11 Home)', 'Asus Vivobook', 8, 4, '- CPU: Intel Core i5-13500H\r\n- RAM/ SSD: 16GB DDR4 / 512GB SSD\r\n- VGA :Intel® Iris Xe Graphics\r\n- Màn hình: 14 inch 2.8K (2880 x 1800) OLED\r\n- Hệ điều hành: Windows 11\r\n- Màu sắc/ Chất liệu: đen', 'Laptop Asus Vivobook 14X OLED S3405VA-KM072W \r\nMàn hình OLED - Độ sáng vượt trội - Cấu hình mạnh mẽ \r\nLaptop Asus luôn đem đến những sản phẩm bất ngờ khiến người dùng phải tò mò về những gì mình đem lại. Laptop Asus Vivobook 14X OLED S3405VA-KM072W là một dòng sản phẩm mới của Asus khiến người dùng chao đảo vì thiết kế vô cùng độc đáo của mình. Định hình tương lai với Vivobook Pro 14X OLED, cỗ máy tối thượng cho khả năng sáng', '21190000', '24334_laptop_asus_vivobook_14x_oled_s3405va_km072w65.jpg', 0, NULL, NULL),
(17, 'Laptop Asus VivoBook Pro 14 OLED K3405VC-KM006W Silver (Cpu i5-13500H, Ram 16GB, SSD 512GB, Vga RTX 3050 4GB, 14 inch WQXGA+ OLED, Win 11 Home)', 'Asus VivoBook', 8, 4, '- CPU:Intel® Core™ i5-13500H\r\n- RAM/ SSD: 16GB DDR4 / 512GB SSD\r\n- VGA :NVIDIA® GeForce® RTX™ 3050 4GB GDDR6\r\n- Màn hình: 14.0-inch 2.8K (2880 x 1800)\r\n- Hệ điều hành: Windows 11\r\n- Màu sắc/ Chất liệu:silver', 'Laptop Asus Vivobook Pro 14 OLED K3405VC-KM006W\r\nHiệu năng mạnh mẽ - Màn hình OLED - Màu sắc hoàn hảo \r\nLaptop Asus luôn đem đến những sản phẩm bất ngờ khiến người dùng phải tò mò về những gì mình đem lại. Laptop Asus Vivobook Pro 14 OLED K3405VC-KM006W là một dòng sản phẩm mới của Asus khiến người dùng chao đảo vì thiết kế vô cùng độc đáo của mình', '27250000', '24259_laptop_asus_vivobook_pro_14_oled_k3405vc_km006w83.jpg', 0, NULL, NULL),
(18, 'Laptop Asus TUF Gaming A15 FA507NU-LP034W Xám (Cpu R7-7735HS, Ram 8GB, SSD 512GB, Vga RTX 4050 6GB, 15.6 inch FHD, Win 11 Home)', 'Asus TUF Gaming', 7, 4, '- CPU : AMD Ryzen 7 7735HS\r\n- RAM/ SSD: 8GB DDR4 /512GB SSD\r\n- VGA: NVIDIA GeForce RTX 4050 6GB GDDR6\r\n- Màn hình: 15.6-inch FHD (1920 x 1080)\r\n- Hệ điều hành: Win 11 home\r\n- Màu sắc: Gray', 'Laptop ASUS TUF Gaming A15 FA507NU-LP034W\r\nCấu hình mạnh mẽ - Tần số quét 144Hz - Màn hình góc rộng \r\nASUS là một trong những hãng sản xuất Laptop nổi tiếng hàng đầu thế giới. Đến nay Asus đã tạo ra rất nhiều sản phẩm có cấu hình mạnh mẽ, vẻ ngoài sang trọng và phù hợp với nhiều phân khúc khách hàng, vì vậy Laptop ASUS đang rất được ưa chuộng hiện nay.\r\n\r\nLaptop ASUS TUF Gaming A15 FA507NU-LP034W được thiết kế mạnh mẽ, chắc chắn, cấu hình cực mạnh đang là mẫu laptop được bán chạy nhất hiện tại của Asus.', '29490000', '24258_laptop_asus_tuf_gaming_a15_fa507nu_lp034w13.jpg', 0, NULL, NULL),
(19, 'Laptop Dell Latitude 3420 L3420I3SSD Black ( Cpu i3-1115G4 (3.00 Ghz, 6 MB), RAM 8GB DDR4, 256GB SSD, Intel UHD Graphics, 14 inch HD, Fedora)', 'Dell Latitude', 8, 5, '- CPU: Intel® Core™ i3-1115G4\r\n- RAM/ SSD: 8GB DDR4/256GB SSD\r\n- VGA::Intel UHD Graphics\r\n- Màn hình: 14.0 inch HD (1366 x 768)\r\n- HĐH: Fedora\r\n- Màu sắc/ Chất liệu: Đen', 'Laptop Dell Latitude 3420 L3420I3SSD \r\nKiểu dáng cứng cáp - Hiệu năng ổn định - Đa dạng cổng kết nối \r\nLaptopDell- là một thương hiệu laptop nổi tiếng toàn cầu và được đông đảo người sử dụng ưa chuộng vì độ bền sử dụng.\r\n\r\nDell Latitude 3420 - là hãng Máy tính xách tay dành cho doanh nhân, có độ bền ca', '14250000', '19846_laptop_dell_latitude_3520_7025159059.jpg', 0, NULL, NULL),
(20, 'Laptop Dell Latitude 3520 - 70251590 Đen (Cpu i7- 1167G7, Ram 8GB, SSd 256GB, 15.6 inch FHD, Fedora,)', 'Dell Latitude', 8, 5, '- CPU: Intel® Core i7-1165G7\r\n- RAM/ SSD: 8GB DDR4 / 256GB SSD\r\n- VGA:Intel Iris Xe Graphics\r\n- Màn hình: 15.6-inch FHD (1920 x 1080)\r\n- Hệ điều hành: Fedora\r\n- Màu sắc/ Chất liệu: Gray', 'Laptop Dell Inspiron 3520 - 70251590\r\nThiết kế gọn nhẹ - Hiệu năng ổn định - Màn hình Full HD chống chói \r\nLaptop Dell - là một thương hiệu laptop nổi tiếng toàn cầu và được đông đảo người sử dụng ưa chuộng vì độ bền sử dụng.\r\n\r\nDell Latitude 3520 là hãng laptop dành cho doanh nhân, có độ bền cao.', '22850000', '19846_laptop_dell_latitude_3520_7025159062.jpg', 0, NULL, NULL),
(21, 'Laptop Dell Vostro 3430 71011900 Xám (Cpu i5-1335U, Ram 8GB, SSD 512GB, Vga Xe Graphics, 14 inch FHD, Win 11 Home Office HS21)', 'Dell Vostro', 8, 5, '- CPU:Intel Core i5-1335U\r\n- RAM/ SSD: 8GB DDR4/512GB SSD\r\n- VGA: Intel Iris Xe Graphics\r\n- Màn hình: 14.Inch FHD\r\n- Hệ điều hành: Win 11 Home + Office Home & Student 2021', 'Laptop Dell Vostro 3430 71011900\r\nThiết kế đơn giản  - Màn hình tấm nền IPS - Hiệu năng ổn định \r\n \r\n\r\nDell là hãng laptop được bán chạy nhất thế giới nhờ có độ bền cao và giá thành thấp.\r\n\r\nDell Vostro là dòng laptop hướng tới người dùng cá nhân như học sinh, sinh viên hay các nhân viên văn phòng...\r\n\r\nDell Vostro 3430 đáp ứng được các yếu tố về thẩm mỹ và có cấu hình đáp ứng được nhu cầu công việc và giải trí vì vậy bạn đừng nên bỏ lỡ sản phẩm này.', '18650000', '24336_laptop_dell_vostro_3430_7101190066.jpg', 0, NULL, NULL),
(22, 'Laptop Apple MacBook Air 13 inch M1 2020 8-core CPU/8GB/256GB/7-core GPU (MGN63SA/A)', 'Apple MacBook', 8, 11, 'Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân văn phòng\r\nHiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS\r\nĐa nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm\r\nTrang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng\r\nChất lượng hình ảnh sắc nét - Màn hình Retina cao cấp cùng công nghệ TrueTone cân bằng màu sắc\r\nThiết kế sang trọng - Nặng chỉ 1.29KG, độ dày 16.1mm. Tiện lợi mang theo mọi nơi', 'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).\r\nMáy, Sách HDSD, Cáp sạc USB-C (2 m), Cốc sạc USB-C 30W\r\n1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider)(xem chi tiết)\r\nGiá sản phẩm đã bao gồm VAT', '18390000', 'macbook-air-gold-select-201810_443.png', 0, NULL, NULL),
(23, 'Macbook Air M2 2022', 'macbook-air-m2-2022', 8, 14, 'Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg\r\nHiệu năng hàng đầu - Chip Apple M2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier\r\nĐa nhiệm mượt mà - Ram 8GB, SSD 256GB cho phép vừa làm việc, vừa nghe nhạc\r\nMàn hình sắc nét - Độ phân giải 2560 x 1664 cùng độ sáng 500 nits\r\nÂm thanh sống động - 4 loa tramg bị công nghệ Dolby Atmos và âm thanh đa chiều', 'Máy mới 100%, đầy đủ phụ kiện từ nhà sản xuất. Sản phẩm có mã SA/A (được Apple Việt Nam phân phối chính thức).\r\nThân máy, cáp sạc, sách HDSD\r\n1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple : Điện Thoại Vui ASP (Apple Authorized Service Provider)(xem chi tiết)\r\nGiá sản phẩm đã bao gồm VAT', '27590000', '1_74_1060.png', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_name`, `shipping_address`, `shipping_phone`, `shipping_email`, `shipping_notes`, `created_at`, `updated_at`) VALUES
(17, 'nguyên hai hoan', 'vinh', '0367102337', 'asdasd@gmailcom', 'qứadasd', NULL, NULL),
(18, 'âssdasd', 'vinh', '0367102337', 'haihoan@gmailcom', 'quản lý', NULL, NULL),
(19, 'Khai dam sau', 'do luong', '12312312', 'asd123@gmailcom', 'cu e', NULL, NULL),
(20, 'Nam', 'Quỳnh lưu', '123321123', 'Namgu123@gmail.com', 'cu e', NULL, NULL),
(21, 'Loi Ho', 'Cho Vinh', '0912312312', 'LoiHo@gmail.com', 'chú e', NULL, NULL),
(22, 'Nguyễn Thị Hiền', 'Nghi Lộc', '0367102337', 'HienNgaso@gmail.com', 'Bạn Hoàn', NULL, NULL),
(23, 'Khai dam sau', 'vinh', '0912312312', 'haihoan@gmailcom', 'qwertyui', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `slider_id` int(11) NOT NULL,
  `slider_name` varchar(255) NOT NULL,
  `slider_status` int(11) NOT NULL,
  `slider_image` varchar(100) NOT NULL,
  `slider_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_slider`
--

INSERT INTO `tbl_slider` (`slider_id`, `slider_name`, `slider_status`, `slider_image`, `slider_desc`) VALUES
(6, 'Valorant', 1, '16x9_2133x1200_highres-msi_titan25.jpeg', 'đẹp'),
(7, 'LOL', 1, 'rogces20211_FOYX61.jpg', 'ádasdasd'),
(8, 'Valoranádasdasd', 1, 'maxresdefault_1280x720-800-resize16.jpeg', 'ádasd');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Chỉ mục cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Chỉ mục cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
