<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class invoices extends Model
{
    use HasFactory;
    protected $fillable = [
        'order_id',
        'customer_name',
        'invoice_number',
        'total_amount',
        'quantity',
    ];
}
