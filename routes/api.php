<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\CustomersController;
use App\Http\Controllers\InvoicesController;
use App\Http\Controllers\OrdersController;
use App\Http\Controllers\ProductsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/



// customers API
Route::get('/customer', [CustomersController::class, 'index']);
Route::get('/customer/{id}', [CustomersController::class, 'show']);
Route::delete('/customer/{id}', [CustomersController::class, 'destroy']);
Route::post('/customer', [CustomersController::class, 'store']);


// invoices API 
Route::get('/invoice', [InvoicesController::class, 'index']);
Route::post('/invoice', [InvoicesController::class, 'store']);
Route::get('/invoice/{id}', [InvoicesController::class, 'show']);
Route::put('/invoice/{id}', [InvoicesController::class, 'update']);
Route::delete('/invoice/{id}', [InvoicesController::class, 'destroy']);

// orders API 
Route::get('/orders', [OrdersController::class, 'index']);
Route::post('/order', [OrdersController::class, 'store']);
Route::get('/order/{id}', [OrdersController::class, 'show']);
Route::put('/order/{id}', [OrdersController::class, 'update']);
Route::delete('/order/{id}', [OrdersController::class, 'destroy']);

// order items API
// Route::get('/orderItems', [OrderItemController::class, 'index']);
// Route::post('/orderItems', [OrderItemController::class, 'store']);
// Route::get('/orderItem/{id}', [OrderItemController::class, 'show']);
// Route::delete('/orderItem/{id}', [OrderItemController::class, 'destroy']);



// products API 
Route::get('/product', [ProductsController::class, 'index']);
Route::post('/product', [ProductsController::class, 'store']);
Route::get('/product/{id}', [ProductsController::class, 'show']);
Route::put('/product/{id}', [ProductsController::class, 'update']);
Route::put('/product/update-quantity/{id}', [ProductsController::class, 'updateQuantity']);
Route::delete('/product/{id}', [ProductsController::class, 'destroy']);
Route::get('/product/category/{category_id}', [ProductsController::class, 'category']);
Route::get('/product/search/{name}', [ProductsController::class, 'search']);
Route::get('/image/{id}', [ProductsController::class, 'getImage']);

//amdin API
Route::post('/login', [AuthController::class, 'login']);
Route::post('/signup', [AuthController::class, 'signup']);

//coupon API
Route::get('/coupons', [CouponController::class, 'index']);
Route::post('/coupon', [CouponController::class, 'store']);
Route::post('/validate-coupon', [CouponController::class, 'validateCoupon']);
Route::delete('/coupon/{coupon}', [CouponController::class, 'destroy']);

// Protected routes 
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
});




// Route::get('/', function () {
//     return view('upload');
// });
