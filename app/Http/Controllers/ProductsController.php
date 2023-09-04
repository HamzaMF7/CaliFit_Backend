<?php

namespace App\Http\Controllers;

use App\Models\products;
use App\Models\categories;
use App\Http\Requests\StoreproductsRequest;
use App\Http\Requests\UpdateproductsRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return products::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreproductsRequest $request)
    {
        $request->validate([
            'title' => 'required',
            'price' => 'required',
            'category' => 'required',
            'quantity' => 'required',
            'image_url' => 'required',
        ]);

        $input = $request->all();

        // Find the category ID based on the category name
        $category = categories::where('name', $input['category'])->first();
        $categoryId = $category->id;
        $input["category_id"] = $categoryId;

        // Upload and store new images
        if ($request->hasFile('image_url')) {
            $imageUrls = [];
            foreach ($request->file('image_url') as $image) {
                $image_name = time() . $image->getClientOriginalName();
                $path = $image->storeAs('images', $image_name, 'public');
                $imageUrls[] = $path;
            }
            $input["image_url"] = $imageUrls;
        }
        // create product 
        $product = products::create($input);
        return response()->json(['message' => 'Product created successfully', 'product' => $product], 201);
    }


    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return products::find($id);
    }

    /**
     * Update the specified resource in storage.
     */


    public function update(UpdateproductsRequest $request, string $id)
    {
        $product = products::find($id);

        // Delete old images from storage
        foreach ($product->image_url as $imageUrl) {
            Storage::disk('public')->delete($imageUrl);
        }

        $input = $request->all();
        
        // Find the category ID based on the category name
        $category = categories::where('name', $input['category'])->first();
        $categoryId = $category->id;
        $input["category_id"] = $categoryId;

        // Upload and store new images
        if ($request->hasFile('image_url')) {
            $imageUrls = [];
            foreach ($request->file('image_url') as $image) {
                $image_name = time() . $image->getClientOriginalName();
                $path = $image->storeAs('images', $image_name, 'public');
                $imageUrls[] = $path;
            }
            $input["image_url"] = $imageUrls;
        }

        // Update product details
        $product->update($input);

        return $product;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return products::destroy($id);
    }

    // Added function 
    public function search($title)
    {
        return products::where('title', 'like', '%' . $title . '%')->get();
    }

    public function category($category_id)
    {
        $products = Products::join('categories', 'products.category_id', '=', 'categories.id')
            ->select('products.*')
            ->where('categories.id', $category_id)
            ->get();
        return response()->json($products);
    }

        /**
     * Update the quantity of the specified product in storage.
     */
    public function updateQuantity(Request $request, string $id)
    {
        $validatedData = $request->validate([
            'itemAmount' => 'required|integer|min:0',
        ]);

        $amount = $validatedData['itemAmount'];

        $product = Products::find($id);

        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }

        $productQuantity = $product->quantity;

        // Check if subtracting the amount would result in a negative quantity
        if ($productQuantity - $amount < 0) {
            return response()->json(['message' => 'Insufficient product quantity'], 400);
        }

        // Update the quantity field
        $product->update([
            'quantity' => $productQuantity - $amount,
        ]);

        return response()->json(['message' => 'Product quantity updated successfully']);
    }
}












    // public function getImage(string $id)
    // {
    //     $product = products::find($id);

    //     $imageUrls = [];
    //     foreach ($product->image_url as $imageUrl) {

    //         Storage::delete('public/' . $imageUrl);
    //         // $url = Storage::url($imageUrl);
    //         // $imageUrls[] = $url;
    //     }
    //     // return response()->json([
    //     //     'urls' => $imageUrls,
    //     // ]);
    // }

        // if ($request->hasFile('image_url')) {

        //     $image = $request->file('image_url');
        //     $image_name = time() . $image->getClientOriginalName();
        //     // Storage::putFileAs($destination_path, $image, $image_name);
        //     $path = $image->storeAs('images', $image_name, 'public');
        //     $input["image_url"] = $path;
        // }

            // get the image path
    // public function getImage($imgname)
    // {
    //     $path = 'images/' . $imgname;
    //     $img = Storage::get($path);
    //     $type = Storage::mimeType($path);

    //     return response($img, 200)->header('Content-Type', $type);
    // }
