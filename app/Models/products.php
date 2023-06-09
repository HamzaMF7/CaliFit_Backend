<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class products extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'description',
        'price',
        'category',
        'category_id',
        'quantity',
        'image_url',
    ];
}
