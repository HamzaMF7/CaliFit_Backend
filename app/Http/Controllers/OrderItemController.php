<?php

namespace App\Http\Controllers;

use App\Models\OrderItem;
use Illuminate\Http\Request;

class OrderItemController extends Controller
{
    // Show all order_items
    public function index()
    {
        $orderItems = OrderItem::all();
        return response()->json($orderItems);
    }

    // Show a specific order_item by id
    public function show($id)
    {
        $orderItem = OrderItem::findOrFail($id);
        return response()->json($orderItem);
    }

    // Create a new order_item
    public function store(Request $request)
    {
        $request->validate([
            'image' => 'required|string|max:255',
            'order_id' => 'required|exists:orders,id',
            'product_id' => 'required|exists:products,id_product',
            'quantity' => 'required|integer',
            'price' => 'required|numeric',
        ]);

        $orderItem = OrderItem::create($request->all());
        return response()->json($orderItem, 201);
    }
    public function destroy($id)
    {
        $orderItem = OrderItem::findOrFail($id);
        $orderItem->delete();
        return response()->json(null, 204);
    }
}
