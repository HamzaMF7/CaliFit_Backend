CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone numbeAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE products (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(255) NOT NULL,
    category_id INT NOT NULL ,
    quantity INT UNSIGNED DEFAULT 0,
    image_url  VARCHAR(255) NULAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_products_category_id FOREIGN KEY (category_id) REFERENCES categories(id),
);

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone number,
    shipping_address VARCHAR(255),
    total_amount DECIMAL(10,2),
    status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') NOT NULAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_order_items_order_id FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    CONSTRAINT fk_order_items_product_id FOREIGN KEY (product_id) REFERENCES products(id_product) ON DELETE CASCADE,
);
CREATE TABLE invoices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    customer_name VARCHAR(255),
    invoice_number VARCHAR(255) NOT NULL UNIQUE,
    total_amount DECIMAL(10,2),
    quantity INAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_invoices_order_id FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
)






-- **********************************************************
CREATE TABLE invoices (
  invoice_number INT PRIMARY KEY,
  invoice_date DATE,
  customer_name VARCHAR(255),
  customer_address VARCHAR(255),
  product_name VARCHAR(255),
  quantity INT,
  price DECIMAL(10,2),
  discount DECIMAL(10,2),
  subtotal DECIMAL(10,2),
  tax_rate DECIMAL(10,2),
  tax_amount DECIMAL(10,2),
  shipping_address VARCHAR(255),
  shipping_method VARCHAR(255),
  shipping_cost DECIMAL(10,2),
  total_amount DECIMAL(10,2),
  payment_method VARCHAR(255),
  terms_and_conditions TEXT
);





-- ***************************************************

[
    {
        "title": "dips",
        "description": "lorem ipsuim lorent",
        "price": "349.00",
        "category": "push",
        "category_id": 1, 
        "quantity": 7,
        "image_url": "cat-01.jpg"
    },
    {
     
        "title": "pull up bar",
        "description": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Saepe distinctio libero, iure nobis laudantium exercitationem reiciendis blanditiis ipsa perferendis eveniet.",
        "price": "300.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 10,
        "image_url": "cat-04.jpg"
    },
    {
     
        "title": "bands",
        "description": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Saepe distinctio libero, iure nobis laudantium exercitationem reiciendis blanditiis ipsa perferendis eveniet.",
        "price": "150.00",
        "category": "others",
        "category_id": 4,
        "quantity": 15,
        "image_url": "cat-07.jpg"
    },
    {
     
        "title": "weight vest",
        "description": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Saepe distinctio libero, iure nobis laudantium exercitationem reiciendis blanditiis ipsa perferendis eveniet.",
        "price": "600.00",
        "category": "others",
        "category_id": 4,
        "quantity": 6,
        "image_url": "cat-06.jpg"
    },
    {
     
        "title": "dip belt",
        "description": "lorem ipsum",
        "price": "300.00",
        "category": "others",
        "category_id": 4,
        "quantity": 13,
        "image_url": "avatar-04.png"
    },
    {
     
        "title": "parallettes",
        "description": "lorem ipsum",
        "price": "300.00",
        "category": "push",
        "category_id": 1,
        "quantity": 20,
        "image_url": "cat-03.jpg"
    },
    {
     
        "title": "long parallettes",
        "description": "lorem upsium",
        "price": "598.00",
        "category": "push",
        "category_id": 1,
        "quantity": 5,
        "image_url": "discount-background1.jpg"
    },
    {
     
        "title": "reset bands",
        "description": "lorem upsium",
        "price": "350.00",
        "category": "others",
        "category_id": 4,
        "quantity": 8,
        "image_url": "team-02.jpg"
    },
    {
        "title": "bar",
        "description": "lorem ipsuim",
        "price": "200.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 15,
        "image_url": "avatar-03.png"
    },
    {
     
        "title": "hfgh",
        "description": "bfgfg",
        "price": "10.00",
        "category": "legs",
        "category_id": 3,
        "quantity": 1,
        "image_url": "Conception et Réalisation d’un site web d’e-Commerce - Widad CHOUEF (1).jpg"
    }
]


select * from products,categories 
where products.id = categories.category_id 


[
    {
        "title": "Premium Parallettes MAX",
        "description": "lorem ipsum",
        "price": "499.00",
        "category": "push",
        "category_id": 1,
        "quantity": 15,
        "image_url": "1parallettesmaxbygornation.jpg",
        
    },
    {
        "title": "Premium Dip Belt",
        "description": "lorem ipsuim",
        "price": "400.00",
        "category": "others",
        "category_id": 4,
        "quantity": 5,
        "image_url": "1dipbeltweightedcalisthenics.jpg",
        
    },
    {
        "title": "Performance Wrist Wraps",
        "description": "lorem",
        "price": "200.00",
        "category": "others",
        "category_id": 4,
        "quantity": 10,
        "image_url": "1performancewristwrapsblack.jpg",
        
    },
    {
        "title": "Adjustable Fitness Equalizer Dip Bars",
        "description": "lorem",
        "price": "1000.00",
        "category": "push",
        "category_id": 1,
        "quantity": 5,
        "image_url": "dips.png",
        
    },
    {
        "title": "Door Gym Pull Up Bar Black",
        "description": "lorem",
        "price": "300.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 12,
        "image_url": "DoorGymPullUpBar.jpg",

    },
    {
        "title": "Multi Grip Pull Up Bar System",
        "description": "lorem",
        "price": "1500.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 4,
        "image_url": "multigripPullup.jpg",
        
    },
    {
        "title": "Multi Training Door Gym Pull Up Bar",
        "description": "lorem",
        "price": "350.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 5,
        "image_url": "MultiTrainingDoorGymPullUpBar.png",
        
    },
    {
        "title": "Straight Grip Pull Up Bar System",
        "description": "lorem",
        "price": "1400.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 5,
        "image_url": "StraightGripPullUpBarSystem.jpg",
        
    }
]