<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class orders extends Model
{
    use HasFactory;
    protected $fillable = [
        'total_price',
        'status',
    ];

    public function orderItems()
    {
        return $this->hasMany(OrderItems::class, 'order_id');
    }
}
