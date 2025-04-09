<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SellPayment extends Model
{
    use HasFactory;
    protected $fillable = [
        'sell_id',
        'payment_date',
        'amount',
        'payment_method',
        'payment_note',
        'payment_account',
        'paid_on'
    ];
}
