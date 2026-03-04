CREATE TABLE `Roles`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `Users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `role_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `photo` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `Categories`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `product_image`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT NOT NULL,
    `image_path` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `Products`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `category_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `quantity` DECIMAL(8, 2) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `Purchases`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `supplier_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `document_type_id` BIGINT NOT NULL,
    `total_cost` DECIMAL(8, 2) NOT NULL,
    `purchase_date` DATE NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `Inventories`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `quantity` DECIMAL(8, 2) NOT NULL,
    `reason` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `purchase_details`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `purchase_id` BIGINT NOT NULL,
    `product_id` BIGINT NOT NULL,
    `quantity` DECIMAL(8, 2) NOT NULL,
    `unit_cost` DECIMAL(8, 2) NOT NULL,
    `subtotal` DECIMAL(8, 2) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `Suppliers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ruc` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `photo` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `document_type`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `Customers`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ruc` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `photo` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `Transactions`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(255) NOT NULL,
    `amount` DECIMAL(8, 2) NOT NULL,
    `reference_id` BIGINT NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `Sales`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `customer_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `document_type_id` BIGINT NOT NULL,
    `total_price` DECIMAL(8, 2) NOT NULL,
    `sale_date` DATE NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `payment_method` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
CREATE TABLE `sales_details`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `sale_id` BIGINT NOT NULL,
    `product_id` BIGINT NOT NULL,
    `quantity` DECIMAL(8, 2) NOT NULL,
    `unit_price` DECIMAL(8, 2) NOT NULL,
    `subtotal` DECIMAL(8, 2) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `update_at` DATETIME NOT NULL
);
ALTER TABLE
    `sales_details` ADD CONSTRAINT `sales_details_sale_id_foreign` FOREIGN KEY(`sale_id`) REFERENCES `Sales`(`id`);
ALTER TABLE
    `product_image` ADD CONSTRAINT `product_image_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Products`(`id`);
ALTER TABLE
    `Inventories` ADD CONSTRAINT `inventories_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Products` ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `Categories`(`id`);
ALTER TABLE
    `sales_details` ADD CONSTRAINT `sales_details_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Products`(`id`);
ALTER TABLE
    `Users` ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY(`role_id`) REFERENCES `Roles`(`id`);
ALTER TABLE
    `purchase_details` ADD CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Products`(`id`);
ALTER TABLE
    `Transactions` ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Sales` ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `Customers`(`id`);
ALTER TABLE
    `Sales` ADD CONSTRAINT `sales_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Purchases` ADD CONSTRAINT `purchases_document_type_id_foreign` FOREIGN KEY(`document_type_id`) REFERENCES `document_type`(`id`);
ALTER TABLE
    `Sales` ADD CONSTRAINT `sales_document_type_id_foreign` FOREIGN KEY(`document_type_id`) REFERENCES `document_type`(`id`);
ALTER TABLE
    `Purchases` ADD CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Purchases` ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY(`supplier_id`) REFERENCES `Suppliers`(`id`);
ALTER TABLE
    `purchase_details` ADD CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY(`purchase_id`) REFERENCES `Purchases`(`id`);
ALTER TABLE
    `Inventories` ADD CONSTRAINT `inventories_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Products`(`id`);
ALTER TABLE
    `Products` ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`);