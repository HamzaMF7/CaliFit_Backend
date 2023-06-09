<?php

namespace App\Http\Controllers;

use App\Models\products;
use App\Models\categories;
use App\Http\Requests\StoreproductsRequest;
use App\Http\Requests\UpdateproductsRequest;
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
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
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
        if ($request->hasFile('image_url')) {
           
            $image = $request->file('image_url');
            $image_name = time() . $image->getClientOriginalName();
            // Storage::putFileAs($destination_path, $image, $image_name);
            $path = $image->storeAs('images', $image_name, 'public');
            $input["image_url"] = $path;
        }

        return products::create($input);
    }


    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return products::find($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(products $products)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateproductsRequest $request, string $id)
    {
        $product = products::find($id);
        $product->update($request->all());
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

    // get the image path
    // public function getImage($imgname)
    // {
    //     $path = 'images/' . $imgname;
    //     $img = Storage::get($path);
    //     $type = Storage::mimeType($path);

    //     return response($img, 200)->header('Content-Type', $type);
    // }


    public function getImage($imgname)
    {
        $path = 'images/' . $imgname;
        $url = Storage::url($path);
    
        return response()->json([
            'url' => $url,
        ]);
    }
    

}
