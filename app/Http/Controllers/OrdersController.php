<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreordersRequest;
use App\Http\Requests\UpdateordersRequest;
use App\Models\orders;
use App\Models\OrderDetails;
use App\Models\OrderItems;
use App\Models\products;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $orders = Orders::withCount('orderItems')->get();

        return response()->json([
            'orders' => $orders,
        ]);
    }

    public function store(Request $request)
    {
        try {
            $orderData = $request->validate([
                'total_price' => 'required|numeric',
                // 'status' => 'string'
            ]);

            $order = Orders::create($orderData);

            $orderDetailsData = $request->validate([
                'first_name' => 'required|string',
                'last_name' => 'required|string',
                'email' => 'required|string',
                'phone_number' => 'required|string',
                'shipping_address' => 'required|string',
                'city' => 'required|string',
            ]);
            $orderDetails = OrderDetails::create(array_merge($orderDetailsData, ['order_id' => $order->id]));

            $orderItemsData = $request->items;
            $orderItems = [];
            foreach ($orderItemsData as $itemData) {
                $orderItemData = [
                    'product_id' => $itemData['product_id'],
                    'product_name' => $itemData['product_name'],
                    'price' => $itemData['price'],
                    'quantity' => $itemData['quantity'],
                    'total_price' => $itemData['total_price'],
                    'order_id' => $order->id,
                ];
                $orderItem = OrderItems::create($orderItemData);
                $orderItems[] = $orderItem;
            }

            $responseData = [
                'order' => $order,
                'order_details' => $orderDetails,
                'order_item' => $orderItems,
                'message' => 'Order created successfully.',
            ];

            return response()->json($responseData);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to create order.', 'error' => $e->getMessage()], 500);
        }
    }

    // public function show(string $order_id)
    // {
    //     $order = Orders::findOrFail($order_id);
    //     $orderDetails = OrderDetails::where('order_id', '=', $order_id)->first();
    //     $orderItemswithoutURL = OrderItems::where('order_id', '=', $order_id)->get();

    //     // **********************************************************************
    //     $imageUrl = products::select('products.id AS ID', 'products.image_url AS ImageURL')
    //         ->join('order_items', 'products.id', '=', 'order_items.product_id')
    //         ->join('orders', 'order_items.order_id', '=', 'orders.id')
    //         ->where('orders.id', $order_id)
    //         ->get();

    //     $orderItems = $orderItemswithoutURL::select("$orderItemswithoutURL.*", "$imageUrl.ImageURL")
    //         ->join($imageUrl, "$orderItemswithoutURL.product_id", '=', "$imageUrl.ID")
    //         ->get();

    //     // **********************************************************************

    //     return response()->json([
    //         'order' => $order,
    //         'orderDetails' => $orderDetails,
    //         'orderItems' => $orderItems,
    //     ]);
    // }

    public function show(string $order_id)
{
    $order = Orders::findOrFail($order_id);
    $orderDetails = OrderDetails::where('order_id', $order_id)->first();
    $orderItemswithoutURL = OrderItems::where('order_id', $order_id)->get();

    // **********************************************************************

    $imageUrl = products::select('products.id AS ID', 'products.image_url AS ImageURL')
        ->join('order_items', 'products.id', '=', 'order_items.product_id')
        ->join('orders', 'order_items.order_id', '=', 'orders.id')
        ->where('orders.id', $order_id)
        ->get();

    $orderItems = $orderItemswithoutURL->map(function ($orderItem) use ($imageUrl) {
        $productImage = $imageUrl->where('ID', $orderItem->product_id)->first();
        $orderItem->ImageURL = $productImage->ImageURL;
        return $orderItem;
    });

    // **********************************************************************

    return response()->json([
        'order' => $order,
        'orderDetails' => $orderDetails,
        'orderItems' => $orderItems,
        'imageURL'=> $imageUrl
    ]);
}

    public function update(Request $request, string $order_id)
    {
        $validatedData = $request->validate([
            'status' => 'string'
        ]);

        $order = Orders::findOrFail($order_id);
        $order->update($validatedData);

        return response()->json([
            'order' => $order,
            'message' => 'Order updated successfully.',
        ]);
    }

    public function destroy($order_id)
    {
        Orders::destroy($order_id);

        return response()->json([
            'message' => 'Order deleted successfully.',
        ]);
    }
}
