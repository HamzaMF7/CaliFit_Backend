<?php

namespace App\Http\Controllers;

// app/Http/Controllers/CouponController.php

use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Coupon;

class CouponController extends Controller
{
    public function index()
    {
        return Coupon::all();
    }
    public function store(Request $request)
    {
        $request->validate([
            'code' => 'required|unique:coupons',
            'discount' => 'required|numeric|min:0',
            'expiration_date' => 'nullable|date',
        ]);

        Coupon::create($request->all());

        return response()->json(['message' => 'Coupon created successfully'], 201);
    }

    public function validateCoupon(Request $request)
    {
        $request->validate([
            'code' => 'required|string',
        ]);

        $coupon = Coupon::where('code', $request->code)->first();

        if (!$coupon) {
            return response()->json(['message' => 'Invalid coupon code'], 404);
        }

        // Check if the coupon is expired
        if ($coupon->expiration_date && Carbon::now()->gt($coupon->expiration_date)) {
            return response()->json(['message' => 'Coupon has expired'], 400);
        }

        return response()->json(['discount' => $coupon->discount], 200);
    }

    public function destroy(Coupon $coupon)
    {
        // Delete the coupon from the database
        $coupon->delete();

        // Redirect or return a response based on your requirements
        return response()->json(['message' => 'Coupon deleted successfully'], 200);
    }
}
