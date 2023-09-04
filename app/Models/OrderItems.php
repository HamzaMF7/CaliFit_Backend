<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItems extends Model
{
    use HasFactory;
    protected $fillable = [
        'product_id',
        'product_name',
        'price',
        'quantity',
        'total_price',
        'order_id', // Make sure to include foreign key field
    ];

    // Define the relationship with Orders
    public function order()
    {
        return $this->belongsTo(Orders::class, 'order_id');
    }

}
