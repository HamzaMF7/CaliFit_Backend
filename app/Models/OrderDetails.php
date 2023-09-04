<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetails extends Model
{
    use HasFactory;
    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'phone_number',
        'shipping_address',
        'city',
        'order_id', // Make sure to include foreign key field
    ];

    // Define the relationship with Orders
    public function order()
    {
        return $this->belongsTo(Orders::class, 'order_id');
    }
}
