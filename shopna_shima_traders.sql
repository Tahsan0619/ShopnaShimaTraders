
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Kitchen','kitchen','Bowls, mugs and food containers for the daily kitchen.','assets/images/categories/kitchen.jpg',0,1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(2,'Storage','storage','Boxes and baskets to keep clothes and household goods in order.','assets/images/categories/storage.jpg',1,1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(3,'Furniture','furniture','Plastic chairs and stools for home and shop use.','assets/images/categories/furniture.jpg',2,1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(4,'Water','water','Bottles and jugs for drinking water at home.','assets/images/categories/water.jpg',3,1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(5,'Bathroom','bathroom','Bathroom sets and pedal bins.','assets/images/categories/bathroom.jpg',4,1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(6,'Cleaning','cleaning','Buckets and everyday cleaning helpers.','assets/images/categories/cleaning.jpg',5,1,'2026-10-13 08:14:46','2026-10-13 08:14:46');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` varchar(191) NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_10_01_134955_create_personal_access_tokens_table',1),(5,'2026_10_01_140000_create_shop_tables',1),(6,'2026_10_01_160000_add_online_payment_to_orders_table',1),(7,'2026_10_02_120000_add_free_shipping_to_products_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `product_name` varchar(191) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(30) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `customer_name` varchar(191) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `city` varchar(191) DEFAULT NULL,
  `shipping_area` varchar(30) NOT NULL DEFAULT 'inside_dhaka',
  `notes` text DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `payment_method` varchar(20) NOT NULL DEFAULT 'cod',
  `payment_status` varchar(20) NOT NULL DEFAULT 'unpaid',
  `transaction_id` varchar(191) DEFAULT NULL,
  `sp_order_id` varchar(100) DEFAULT NULL,
  `payment_channel` varchar(50) DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_status_index` (`status`),
  KEY `orders_sp_order_id_index` (`sp_order_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `content` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'About Us','about-us','<h2>Welcome to M/S Shopna Shima Traders</h2>\n<p><strong>M/S Shopna Shima Traders</strong> sells RFL household products for the kitchen, storage, furniture, water, bathroom and cleaning. We keep practical plastic goods that families and shops use every day, and we deliver across Bangladesh.</p>\n<hr>\n<h3><i class=\"fa-solid fa-boxes-stacked\"></i> What we offer</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-utensils\"></i><span><strong>Kitchen:</strong> bowls, mugs and food containers.</span></li>\n<li><i class=\"fa-solid fa-box\"></i><span><strong>Storage:</strong> boxes and laundry baskets.</span></li>\n<li><i class=\"fa-solid fa-chair\"></i><span><strong>Furniture:</strong> chairs and stools.</span></li>\n<li><i class=\"fa-solid fa-bottle-water\"></i><span><strong>Water:</strong> bottles and jugs.</span></li>\n<li><i class=\"fa-solid fa-sink\"></i><span><strong>Bathroom:</strong> accessory sets and pedal bins.</span></li>\n<li><i class=\"fa-solid fa-bucket\"></i><span><strong>Cleaning:</strong> buckets with lids.</span></li>\n</ul>\n<hr>\n<h3><i class=\"fa-solid fa-award\"></i> Why shop with us?</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-circle-check\"></i><span>RFL and everyday household products in one shop</span></li>\n<li><i class=\"fa-solid fa-circle-check\"></i><span>Clear prices and regular offers</span></li>\n<li><i class=\"fa-solid fa-circle-check\"></i><span>Cash on Delivery and secure online payment via shurjoPay (bKash, Nagad, Rocket, Visa, Mastercard)</span></li>\n<li><i class=\"fa-solid fa-circle-check\"></i><span>Home delivery all over Bangladesh</span></li>\n</ul>\n<hr>\n<h3><i class=\"fa-solid fa-headset\"></i> Contact us</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-phone\"></i><span>Phone: <a href=\"tel:01754471654\">01754471654</a></span></li>\n<li><i class=\"fa-brands fa-whatsapp\"></i><span>WhatsApp: <a href=\"https://wa.me/8801754471654\" target=\"_blank\" rel=\"noopener\">01754471654</a></span></li>\n<li><i class=\"fa-solid fa-envelope\"></i><span>Email: <a href=\"mailto:info@shopnashimatraders.com\">info@shopnashimatraders.com</a></span></li>\n</ul>',1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(2,'Refund and Returns Policy','refund-returns','<h2>Refund &amp; Returns Policy</h2>\n<p>At <strong>M/S Shopna Shima Traders</strong> we want the product you receive to match the one you ordered. If it does not, this is how returns and refunds work.</p>\n<h3><i class=\"fa-solid fa-circle-check\"></i> Eligible for return / replacement</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-circle-check\"></i><span><strong>Wrong product delivered:</strong> the item, size or colour is different from your order.</span></li>\n<li><i class=\"fa-solid fa-circle-check\"></i><span><strong>Damaged on arrival:</strong> cracks, breaks or a missing part found at delivery.</span></li>\n<li><i class=\"fa-solid fa-circle-check\"></i><span><strong>Missing items:</strong> pieces listed with a set are missing.</span></li>\n</ul>\n<p>Please tell us within <strong>3 days of delivery</strong> and share photos of the product and the packaging.</p>\n<h3><i class=\"fa-solid fa-circle-xmark\"></i> Not eligible</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-circle-xmark\"></i><span>Products damaged after delivery or used beyond a quick check</span></li>\n<li><i class=\"fa-solid fa-circle-xmark\"></i><span>Items returned without the original box or invoice</span></li>\n<li><i class=\"fa-solid fa-circle-xmark\"></i><span>Change of mind after the product has been used</span></li>\n</ul>\n<h3><i class=\"fa-solid fa-rotate-left\"></i> Refund process</h3>\n<ul>\n<li>Once we receive and check the return, we confirm a refund or a replacement.</li>\n<li>Approved refunds are processed within <strong>5 to 7 business days</strong>.</li>\n<li>Online payments made through shurjoPay are refunded to the original payment method. Cash on Delivery orders are refunded via bKash, Nagad or bank transfer.</li>\n<li>Delivery charges are refunded only when the return is our mistake.</li>\n</ul>\n<h3><i class=\"fa-solid fa-headset\"></i> Contact us</h3>\n<p>For a return or refund question, call or message us.</p>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-phone\"></i><span>Phone: <a href=\"tel:01754471654\">01754471654</a></span></li>\n<li><i class=\"fa-brands fa-whatsapp\"></i><span>WhatsApp: <a href=\"https://wa.me/8801754471654\" target=\"_blank\" rel=\"noopener\">01754471654</a></span></li>\n</ul>',1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(3,'Terms & Conditions','terms-conditions','<h2>Terms &amp; Conditions</h2>\n<p>By using the M/S Shopna Shima Traders website or placing an order, you agree to these terms.</p>\n<h3>1. Products &amp; pricing</h3>\n<ul>\n<li>All prices are in Bangladeshi Taka (৳).</li>\n<li>Product photos show the item. Colour and packaging can vary slightly.</li>\n<li>Prices, offers and stock can change without notice. RFL product names refer to goods we stock from that range.</li>\n</ul>\n<h3>2. Orders</h3>\n<ul>\n<li>We may call you to confirm an order before it is shipped.</li>\n<li>We may cancel an order if a product is out of stock, the price was listed incorrectly, or the details cannot be verified. Any payment already taken is refunded in full.</li>\n</ul>\n<h3>3. Payment</h3>\n<ul>\n<li>We accept Cash on Delivery and online payment through <strong>shurjoPay</strong> (bKash, Nagad, Rocket, Visa, Mastercard and other supported methods).</li>\n<li>Online payments are processed by shurjoPay. We never see or store your card or wallet PIN.</li>\n</ul>\n<h3>4. Delivery</h3>\n<ul>\n<li>Inside Dhaka: usually within 24 to 48 hours. Outside Dhaka: usually within 2 to 5 business days.</li>\n<li>Please check the product before you accept it.</li>\n<li>If delivery fails because of a wrong address or an unreachable phone, a re-delivery charge may apply.</li>\n</ul>\n<h3>5. Privacy</h3>\n<p>Your name, phone number and address are used to process and deliver your order. They are not sold to anyone else.</p>\n<h3>6. Returns</h3>\n<p>See our <a href=\"refund-returns.html\">Refund &amp; Returns Policy</a>.</p>\n<h3>7. Contact</h3>\n<ul class=\"icon-list\">\n<li><i class=\"fa-solid fa-phone\"></i><span>Phone: <a href=\"tel:01754471654\">01754471654</a></span></li>\n<li><i class=\"fa-brands fa-whatsapp\"></i><span>WhatsApp: <a href=\"https://wa.me/8801754471654\" target=\"_blank\" rel=\"noopener\">01754471654</a></span></li>\n</ul>',1,'2026-10-13 08:14:46','2026-10-13 08:14:46');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT 0,
  `unit` varchar(50) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `sold_count` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Serving Bowl Set','serving-bowl-set','A nested set of three serving bowls for rice, curry and everyday meals.','<p>A nested set of three serving bowls for rice, curry and everyday meals.</p><h3>Details</h3><ul><li>Set of 3 nested bowls</li><li>Light and easy to carry</li><li>Smooth rim</li><li>Easy to wash</li><li>For home and shop use</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',650.00,520.00,40,'Set of 3','assets/images/products/serving-bowls.jpg',1,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(2,1,'Mug Set of 6','mug-set-of-6','A set of six everyday plastic mugs for tea, water and family use.','<p>A set of six everyday plastic mugs for tea, water and family use.</p><h3>Details</h3><ul><li>6 mugs</li><li>Comfortable handle</li><li>Stackable</li><li>Easy to wash</li><li>Mixed red, white and navy</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',360.00,290.00,70,'6 mugs','assets/images/products/mug-set.jpg',0,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(3,1,'Food Container Set','food-container-set','Three airtight food containers for leftovers, snacks and the fridge.','<p>Three airtight food containers for leftovers, snacks and the fridge.</p><h3>Details</h3><ul><li>Set of 3</li><li>Locking lids</li><li>Clear body</li><li>Fridge friendly</li><li>Easy to stack</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',620.00,510.00,45,'Set of 3','assets/images/products/food-containers.jpg',1,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(4,2,'Storage Box 40L','storage-box-40l','A large lidded storage box for clothes, toys and household goods.','<p>A large lidded storage box for clothes, toys and household goods.</p><h3>Details</h3><ul><li>About 40 litre capacity</li><li>Fitted lid</li><li>Strong side walls</li><li>Easy to stack</li><li>For bedroom, shop or store room</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',890.00,740.00,30,'40 litre','assets/images/products/storage-box.jpg',1,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(5,2,'Laundry Basket','laundry-basket','An oval laundry basket that is light to carry from room to room.','<p>An oval laundry basket that is light to carry from room to room.</p><h3>Details</h3><ul><li>Open oval shape</li><li>Side handles</li><li>Lightweight</li><li>Airy sides</li><li>For clothes and linen</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',780.00,650.00,28,'Navy','assets/images/products/laundry-basket.jpg',0,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(6,3,'Plastic Arm Chair','plastic-arm-chair','A sturdy armchair for dining, waiting areas and shop floors.','<p>A sturdy armchair for dining, waiting areas and shop floors.</p><h3>Details</h3><ul><li>Armrests</li><li>Wide seat</li><li>Strong legs</li><li>Easy to wipe clean</li><li>Indoor and covered outdoor use</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',1850.00,1590.00,20,'Red','assets/images/products/plastic-chair.jpg',1,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(7,3,'Plastic Stool','plastic-stool','A compact four-leg stool for kitchen, bathroom and extra seating.','<p>A compact four-leg stool for kitchen, bathroom and extra seating.</p><h3>Details</h3><ul><li>Four legs</li><li>Compact seat</li><li>Light to move</li><li>Easy to clean</li><li>Everyday home use</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',480.00,390.00,50,'Red','assets/images/products/plastic-stool.jpg',0,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(8,4,'2 Litre Water Bottle','2-litre-water-bottle','A clear 2 litre water bottle with a firm cap for home and travel.','<p>A clear 2 litre water bottle with a firm cap for home and travel.</p><h3>Details</h3><ul><li>2 litre capacity</li><li>Clear body</li><li>Screw cap</li><li>Easy to refill</li><li>For drinking water</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',280.00,220.00,80,'2 litre','assets/images/products/water-bottle.jpg',1,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(9,4,'2 Litre Water Jug','2-litre-water-jug','A 2 litre jug with a handle and lid for the dining table.','<p>A 2 litre jug with a handle and lid for the dining table.</p><h3>Details</h3><ul><li>2 litre capacity</li><li>Handle and lid</li><li>Pouring spout</li><li>Light to carry</li><li>Table and fridge use</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',240.00,190.00,60,'2 litre','assets/images/products/water-jug.jpg',1,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(10,5,'Bathroom Accessory Set','bathroom-accessory-set','A soap dish, tumbler and toothbrush holder for a tidy bathroom shelf.','<p>A soap dish, tumbler and toothbrush holder for a tidy bathroom shelf.</p><h3>Details</h3><ul><li>Soap dish</li><li>Tumbler</li><li>Toothbrush holder</li><li>Easy to wipe</li><li>Countertop use</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',540.00,450.00,35,'3 pieces','assets/images/products/bathroom-set.jpg',0,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(11,5,'Pedal Dustbin 15L','pedal-dustbin-15l','A pedal bin so the lid opens without touching it.','<p>A pedal bin so the lid opens without touching it.</p><h3>Details</h3><ul><li>About 15 litre</li><li>Foot pedal</li><li>Removable inner bucket</li><li>Slow-close style lid</li><li>Bathroom or kitchen</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',950.00,790.00,22,'15 litre','assets/images/products/pedal-bin.jpg',1,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(12,6,'20 Litre Bucket with Lid','20-litre-bucket-with-lid','A 20 litre bucket with a matching lid for washing, storage and shop use.','<p>A 20 litre bucket with a matching lid for washing, storage and shop use.</p><h3>Details</h3><ul><li>About 20 litre</li><li>Matching lid</li><li>Strong handle</li><li>Easy to rinse</li><li>Home and shop use</li></ul><h3>Why buy from M/S Shopna Shima Traders?</h3><ul><li>Household plastic goods, including RFL products</li><li>Practical pieces for kitchen, storage and home</li><li>Cash on Delivery or secure online payment (bKash, Nagad, cards)</li><li>Delivery all over Bangladesh</li></ul>',420.00,350.00,55,'20 litre','assets/images/products/bucket.jpg',0,1,0,0,'2026-10-13 08:14:46','2026-10-13 08:14:46');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) DEFAULT NULL,
  `subtitle` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `link` varchar(191) DEFAULT NULL,
  `position` varchar(20) NOT NULL DEFAULT 'main',
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,'RFL Household Products','Kitchen, storage, furniture and water solutions for the home','assets/images/slides/slide-1.jpg','shop.html','main',1,1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(2,'Stock the Kitchen','Bowls, containers, bottles and jugs at everyday prices','assets/images/slides/slide-2.jpg','shop.html?category=kitchen','main',2,1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(3,'Kitchen',NULL,'assets/images/products/serving-bowls.jpg','shop.html?category=kitchen','side',1,1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(4,'Furniture',NULL,'assets/images/products/plastic-chair.jpg','shop.html?category=furniture','side',2,1,'2026-10-13 08:14:46','2026-10-13 08:14:46'),(5,'Water',NULL,'assets/images/products/water-jug.jpg','shop.html?category=water','side',3,1,'2026-10-13 08:14:46','2026-10-13 08:14:46');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@gmail.com','01754471654',NULL,NULL,1,NULL,'$2y$12$2HlNqN5QrxZVsXz9l1doZudylawnBlRuBDlKmxDIJbPwpA0xk4QyO',NULL,'2026-10-13 08:14:45','2026-10-13 08:14:45'),(2,'Customer','customer@gmail.com',NULL,NULL,NULL,0,NULL,'$2y$12$RxNYhsZt8NTDLE19vUcEquYt3IgtobfiaTESrB6Hw.KyARpRvInz2',NULL,'2026-10-13 08:14:46','2026-10-13 08:14:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

