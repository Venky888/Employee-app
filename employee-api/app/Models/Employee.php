<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
   protected $fillable = [
    'name',
    'email',
    'employee_id',
    'experience',
    'is_active',
    'joining_date'
];
}
