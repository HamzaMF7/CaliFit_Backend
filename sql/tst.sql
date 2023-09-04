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
    image VARCHAR(255), 
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_order_items_order_id FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    CONSTRAINT fk_order_items_product_id FOREIGN KEY (product_id) REFERENCES products(id_product) ON DELETE CASCADE
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
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image VARCHAR(255), 
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_order_items_order_id FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    CONSTRAINT fk_order_items_product_id FOREIGN KEY (product_id) REFERENCES products(id_product) ON DELETE CASCADE
);

-- **********************************************************






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



database/migrations/2023_08_02_152952_update_coupons_table.php

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




[
    {
        "id": 57,
        "title": "Premium Parallettes MAX",
        "description": "Our parallettes offer an optimal grip with their 40mm beech wood construction. The combination of wood and steel ensures a solid and durable build, providing you with a reliable platform for your workouts. Not only are they sturdy, but they are also designed for convenience. The parallettes are easy to store and transport, making them ideal for home gyms or on-the-go training. With each purchase, you'll receive two parallettes along with useful accessories to further enhance your training experience.",
        "price": "500.00",
        "category": "push",
        "category_id": 1,
        "quantity": 15,
        "image_url": null,
        "created_at": "2023-05-31T13:11:15.000000Z",
        "updated_at": "2023-05-31T23:35:15.000000Z"
    },
    {
        "id": 58,
        "title": "Premium Dip Belt",
        "description": "Experience maximum wearing comfort with the padded design. Rest assured with its laboratory-tested durability, capable of handling loads of up to 1000kg. Crafted from 100% stainless steel, this product guarantees longevity. It comes complete with three carabiners, a 90cm long chain, and a convenient carry bag. For added versatility, you can opt for the version that includes an additional 90g light rope.",
        "price": "400.00",
        "category": "others",
        "category_id": 4,
        "quantity": 5,
        "image_url": null,
        "created_at": "2023-05-31T13:12:42.000000Z",
        "updated_at": "2023-05-31T23:43:53.000000Z"
    },
    {
        "id": 59,
        "title": "Performance Wrist Wraps",
        "description": "Enhance your performance with wrist support designed to maximize your potential. Enjoy stability and safety during your training sessions. The adjustable level of support allows you to customize your experience. Developed in collaboration with professional athletes, this product is designed to meet your needs. Its innovative silicone coating sets it apart from the rest.",
        "price": "200.00",
        "category": "others",
        "category_id": 4,
        "quantity": 10,
        "image_url": null,
        "created_at": "2023-05-31T13:14:36.000000Z",
        "updated_at": "2023-05-31T23:44:57.000000Z"
    },
    {
        "id": 60,
        "title": "Adjustable Fitness Equalizer Dip Bars",
        "description": "The Equalizer has an adjustable height of 70 to 100 cm.",
        "price": "1000.00",
        "category": "push",
        "category_id": 1,
        "quantity": 5,
        "image_url": null,
        "created_at": "2023-05-31T13:16:00.000000Z",
        "updated_at": "2023-05-31T23:30:46.000000Z"
    },
    {
        "id": 61,
        "title": "Door Gym Pull Up Bar Black",
        "description": "The compact black chin-up bar can be placed in almost any doorway.",
        "price": "300.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 20,
        "image_url": null,
        "created_at": "2023-05-31T13:17:35.000000Z",
        "updated_at": "2023-06-21T20:26:37.000000Z"
    },
    {
        "id": 62,
        "title": "Multi Grip Pull Up Bar System",
        "description": "Robust pull-up bar with many handles for indoor and outdoor use.",
        "price": "1500.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 8,
        "image_url": null,
        "created_at": "2023-05-31T13:19:07.000000Z",
        "updated_at": "2023-06-21T21:15:26.000000Z"
    },
    {
        "id": 63,
        "title": "Multi Training Door Gym Pull Up Bar",
        "description": "Due to the unique design this pull-up bar can be mounted without screws.",
        "price": "350.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 5,
        "image_url": null,
        "created_at": "2023-05-31T13:20:00.000000Z",
        "updated_at": "2023-05-31T23:30:20.000000Z"
    },
    {
        "id": 64,
        "title": "Straight Grip Pull Up Bar System",
        "description": "Pull-up bar with a large distance between wall and bar for inside and outside use.",
        "price": "1400.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 10,
        "image_url": null,
        "created_at": "2023-05-31T13:21:08.000000Z",
        "updated_at": "2023-06-21T20:41:38.000000Z"
    },
    {
        "id": 65,
        "title": "Muscle Up Pack - Resistance Fitness Bands",
        "description": "Set consists of four Resistance Bands that help you learn the muscle-up.",
        "price": "550.00",
        "category": "others",
        "category_id": 4,
        "quantity": 13,
        "image_url": null,
        "created_at": "2023-06-01T00:03:49.000000Z",
        "updated_at": "2023-06-21T20:25:52.000000Z"
    },
    {
        "id": 67,
        "title": "Weight Vest 20KG Black / Grey",
        "description": "Comfortable weight vest that can be adjusted from 1 to a maximum of 20 kg.",
        "price": "1200.00",
        "category": "others",
        "category_id": 4,
        "quantity": 15,
        "image_url": null,
        "created_at": "2023-06-01T00:07:12.000000Z",
        "updated_at": "2023-06-21T21:03:36.000000Z"
    },
    {
        "id": 68,
        "title": "Bulgarian bag",
        "description": "This sand-filled crescent-shaped bag offers a wide variety of movements, particularly appreciated in the field of bodybuilding, motor skills exercises, and functional training. Its two flexible handles provide a firm grip and ensure more effective workouts.",
        "price": "340.00",
        "category": "legs",
        "category_id": 3,
        "quantity": 14,
        "image_url": null,
        "created_at": "2023-06-01T00:15:27.000000Z",
        "updated_at": "2023-06-15T16:44:27.000000Z"
    },
    {
        "id": 69,
        "title": "Weighted bag",
        "description": "The weighted bag is the ideal choice for those demanding in training. It has been created with the best possible design. It allows you to perform a multitude of exercises, enabling you to strengthen the entire body and improve your cardiovascular capacity.",
        "price": "340.00",
        "category": "legs",
        "category_id": 3,
        "quantity": 15,
        "image_url": null,
        "created_at": "2023-06-01T00:17:17.000000Z",
        "updated_at": "2023-06-01T00:17:17.000000Z"
    },
    {
        "id": 78,
        "title": "Premium Parallettes ACTIVE",
        "description": "The parallettes offered in this package are designed with optimal grip in mind, thanks to their 40mm beech wood construction. They feature a solid and sturdy build, combining wood and steel for durability. Additionally, these parallettes are designed to be easy to store and transport, making them convenient for both home and gym use. The package includes two parallettes along with useful accessories to enhance your workout experience.",
        "price": "700.00",
        "category": "push",
        "category_id": 1,
        "quantity": 10,
        "image_url": null,
        "created_at": "2023-06-15T12:36:40.000000Z",
        "updated_at": "2023-06-15T12:36:40.000000Z"
    },
    {
        "id": 79,
        "title": "Mini Wooden Parallettes",
        "description": "The Mini Parallettes are a portable version of the normal Wooden Parallettes. The Mini's are used for push-ups, a planche, L-sit or various handstand variations. Due to the compact and light size, the Mini Parallettes are easy to take with you to an outdoor workout, the gym or when traveling.",
        "price": "300.00",
        "category": "push",
        "category_id": 1,
        "quantity": 8,
        "image_url": null,
        "created_at": "2023-06-15T12:44:33.000000Z",
        "updated_at": "2023-06-15T12:44:33.000000Z"
    },
    {
        "id": 80,
        "title": "BULGARIAN BAG 25KG",
        "description": "Ideal for gym and home workouts alike, incorporate the Bulgarian Bag into your regimen for squats, lunges, deadlifts, and curls. In fact, you can target just about every body part thanks to its ergonomic design. Get creative to take your routine to the next leve",
        "price": "500.00",
        "category": "legs",
        "category_id": 3,
        "quantity": 5,
        "image_url": null,
        "created_at": "2023-06-15T14:18:47.000000Z",
        "updated_at": "2023-06-15T14:18:47.000000Z"
    },
    {
        "id": 81,
        "title": "Pro chinning Bar",
        "description": "The steel chin-up bar is easy to attach to the wall or ceiling.",
        "price": "700.00",
        "category": "pull",
        "category_id": 2,
        "quantity": 5,
        "image_url": null,
        "created_at": "2023-06-15T16:45:22.000000Z",
        "updated_at": "2023-06-15T16:45:22.000000Z"
    }
]



{"title": "Premium Dip Belt test",
        "description": "Experience maximum wearing comfort with the padded design. Rest assured with its laboratory-tested durability, capable of handling loads of up to 1000kg. Crafted from 100% stainless steel, this product guarantees longevity. It comes complete with three carabiners.",
        "price": "400.00",
        "category": "others",
        "category_id": 4,
        "quantity": 5,
        "image_url": ["test.jpg","test2.jpg","test3.jpg"]
}




<?php

namespace App\Http\Controllers;


use App\Models\OrderDetails;
use App\Models\OrderItem;
use App\Models\OrderItems;
use App\Models\Orders;
use App\Models\Products;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Orders::withCount('orderItems')->get();

        return response()->json([
            'orders' => $orders,
        ]);
    }



    public function store(Request $request)
    {
        $orderId = 0;
        $validatedData = $request->validate([
            'total_price' => 'required|numeric',
            'status' => 'string'
        ]);

        try {
            $order = Orders::create($validatedData);
            $orderId = $order['order_id'];


            $validatedOrderItemsData['order_id'] = $orderId;

            $validatedOrderDeailsData = $request->validate([
                'first_name' => 'required|string',
                'last_name' => 'required|string',
                'phone' => 'required|string', // Use string instead of integer
                'email' => 'required|string',
                'adresse' => 'required|string',
                'city' => 'required|string',
                'country' => 'required|string',
                'zipcode' => 'required|string', // Use string instead of integer
            ]);
            $validatedOrderDeailsData['order_id'] = $orderId;

            // Check if the order exists before creating order details and items
            if (!$order) {
                throw new \Exception('Failed to create order details and items.', $orderId);
            }
            $orderDetails = OrderDetails::create($validatedOrderDeailsData);

            $orderItems = [];
            $items = json_decode($request->items, true);
            foreach ($items as $item) {
                $validatedOrderItemsData = [
                    'product_id' => null,
                    'color' => null,
                    'size' => null,
                    'quantity' => null,
                    'unit_price' => null,
                    'order_id' => $orderId,
                ];
                $validatedOrderItemsData['product_id'] = $item['product_id'];
                $validatedOrderItemsData['quantity'] = $item['quantity'];
                $validatedOrderItemsData['color'] = $item['color'];
                $validatedOrderItemsData['size'] = $item['size'];
                $validatedOrderItemsData['unit_price'] = $item['price'];
                $orderItem = OrderItems::create($validatedOrderItemsData);
                // Check if the order item exists before creating order items

                if (!$orderItem) {
                    throw new \Exception('Failed to create order items.', $orderId);
                    break;
                }
                $orderItems[] = $orderItem;
            };

            $responseData = [
                'order' => $order,
                'order_details' => $orderDetails,
                'order_item' => $orderItems,
                'message' => 'Order created successfully.',
            ];

            return response()->json($responseData);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to create order.', 'order-id' => $orderId, $e, $request->all()], 500);
        }
    }


    public function show(Orders $order,string $order_id)
    {
        $order = Orders::findOrFail($order_id);
        $orderId = $order['id'];
        $orderDetails = OrderDetails::where('order_id', '=', $order_id)->first();
        $orderItemswithoutURL = OrderItems::
        join('products', 'order_items.product_id', '=', 'products.product_id')->where('order_id', '=', $order_id)->get();

        $imageUrl = Products::select('products.id AS ID', 'products.image_url AS ImageURL')
    ->join('order_items', 'products.id', '=', 'order_items.product_id')
    ->join('orders', 'order_items.order_id', '=', 'orders.id')
    ->where('orders.id', $orderId)
    ->get();
        
$orderItems = $orderItemswithoutURL::select("$orderItemswithoutURL.*", "$imageUrl.ImageURL")
    ->join($imageUrlsTable, "$orderItemswithoutURL.product_id", '=', "$imageUrl.ID")
    ->get();

        return response()->json([
            'order' => $order,
            'orderDetails' => $orderDetails,
            'orderItems' => $orderItems,
        ]);
    }

    public function update(Request $request, string $order_id)
    {
        $validatedData = $request->validate([
            'status' => 'string'
        ]);

        // $order= Orders::where( 'order_id', '=', $order_id)->first();
        $order= Orders::find($order_id);
        $order->update($validatedData);
        return response()->json([
            'order' => $order,
            'message' => 'Order updated successfully.',
        ]);
    }

    public function destroy(Orders $order, $order_id)
    {
        $order->destroy($order_id);

        return response()->json([
            'message' => 'Order deleted successfully.',
        ]);
    }
}


import { Table } from "antd";
import React, { useEffect, useState } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";

function OrdersDetail() {
  const { orderId } = useParams();
  const [Order, setOrder] = useState({});
  const [OrderDetails, setOrderDetails] = useState({});
  const [OrderItems, setOrderItems] = useState([]);

  const fetchDataFromServer = async () => {
    try {
      const response = await axios.get(
        `http://127.0.0.1:8000/api/orders/${orderId}`
      );
      setOrder(response.data.order);
      setOrderDetails(response.data.orderDetails);
      setOrderItems(response.data.orderItems);
      console.log(response.data);
    } catch (error) {
      console.log(error);
    }
  };
  useEffect(() => {
    fetchDataFromServer();
  }, []);

  const dateConverter = (datetoconvert) => {
    let date = new Date(datetoconvert);
    let day = date.getDate();
    let month = date.getMonth() + 1;
    let year = date.getFullYear();
    let newDate = `${day}-${month}-${year}`;
    return newDate;
  };

  const columns = [
    {
      title: "Product Image",
      key: "title",
      render(text, record) {
        return (
          <img
            src={`http://127.0.0.1:8000/storage/${record.image}`}
            alt="product"
            style={{ width: "100px", height: "100px" }}
          />
        );
      },
    },
    {
      title: "Product Name",
      dataIndex: "title",
      key: "title",
    },
    {
      title: "Quantity",
      dataIndex: "quantity",
      key: "quantity",
    },
    {
      title: "Color",
      dataIndex: "color",
      key: "Color",
    },
    {
      title: "Size",
      dataIndex: "size",
      key: "size",
    },
    {
      title: "Unit Price",
      dataIndex: "unit_price",
      key: "unit_price",
    },
  ];
  return (
    <div className="rounded p-3 bg-white shadow-sm">
      <div className="orders-detail-container d-flex justify-content-between  border-bottom p-3">
        <div>
          <h2 className="fw-regular fs-4">Order Info</h2>
          <h3 className="fw-regular fs-5">
            Order number{" "}
            <span className="fw-regular fs-6 text-secondary">#{orderId}</span>
          </h3>
        </div>
        <div className="text-end">
          <h3 className="fw-regular fs-5">
            Order status:{" "}
            <span className="fw-regular fs-6 text-secondary">
              {Order.status}
            </span>
          </h3>
          <h3 className="fw-regular fs-5 ">
            Order date:
            <span className="fw-regular fs-6 text-secondary">
              {" "}
              {dateConverter(Order.created_at)}
            </span>
          </h3>
        </div>
      </div>

      {/* shipping details */}
      <div className="order-infos p-3 text-capitalize">
        <h2 className="fw-regular fs-4 ">shipping To</h2>
        <div className="order-infos d-flex justify-content-between ">
          <div>
            <div>
              <h3 className="fw-regular fs-6 text-secondary">
                {OrderDetails["last_name"] + " " + OrderDetails["first_name"]}
              </h3>
              <h3 className="fw-regular fs-6 text-secondary">
                <span className="">{OrderDetails["email"]}</span>
              </h3>
              <h3 className="fw-regular fs-6 text-secondary">
                {OrderDetails["phone"]}
              </h3>
            </div>
          </div>
          <div className="text-end">
            <h3 className="fw-regular fs-6 text-secondary">
              {OrderDetails["adresse"]}
            </h3>
            <h3 className="fw-regular fs-6 text-secondary">
              {OrderDetails["city"] + " " + OrderDetails["country"]}
            </h3>
            <h3 className="fw-regular fs-6 text-secondary">
              {OrderDetails["zipcode"]}
            </h3>
          </div>
        </div>
      </div>

      <div className="order-item my-2 p-3">
        <h2 className="fw-regular fs-4">Order items</h2>
        <Table dataSource={OrderItems} columns={columns} 
        pagination={OrderItems.length <8 ? false : true}
        />
      </div>
      <div className="order-item my-2 p-3 text-end">
        <h3 className="fw-regular fs-5 ">
          Total: {"   "}
          <span className="fw-regular fs-6 text-secondary ml-2">
            {Order.total_price} DH
          </span>
        </h3>
      </div>
    </div>
  );
}

export default OrdersDetail;



-- test for api 
{
  "total_price": 100.00,
  "status": "pending",
  "items": [
    {
      "product_id": 1,
      "product_name": "pull up bar",
      "price": 50.00,
      "quantity": 2,
      "total_price": "100.00",
      "order_id":""
    },
    {
      "product_id": 5,
      "product_name": "bar dips",
      "price": 50.00,
      "quantity": 3,
      "total_price": "150.00",
      "order_id":""
    }
  ],
  "first_name": "John",
  "last_name": "Doe",
  "email": "john@example.com",
  "phone_number": "1234567890",
  "shipping_address": "123 Main St",
  "city": "Cityville",
  "order_id":""
}


{first_name : firstName , last_name: lastName , email: email , phone_number: phoneNumber , shipping_address: shippingAddress}



SELECT products.id AS ID , products.image_url AS ImageURL FROM `products`, `orderItems` , `orders` 
WHERE products.id = order_items.product_id 
and order_items.order_id = 7 ;



select category_id from $request , categories where 
$input.category = categories.name


use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductsRequest;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ProductsController extends Controller
{
    public function store(StoreProductsRequest $request)
    {
        $validatedData = $request->validated();
        
        // Find the category ID based on the category name
        $category = Category::where('name', $validatedData['category'])->first();
        if (!$category) {
            return response()->json(['message' => 'Category not found'], 404);
        }
        $categoryId = $category->id;

        // Upload images and store their paths
        $imageUrls = [];
        if ($request->hasFile('image_url')) {
            foreach ($request->file('image_url') as $image) {
                $image_name = time() . Str::slug($image->getClientOriginalName());
                $path = $image->storeAs('images', $image_name, 'public');
                $imageUrls[] = $path;
            }
        }
        $validatedData["image_url"] = $imageUrls;

        // Create the product
        $product = Product::create($validatedData);

        return response()->json(['message' => 'Product created successfully', 'product' => $product], 201);
    }
}


