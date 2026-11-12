<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Classroom extends Model
{
    protected $fillable = ['school_id', 'name', 'school_year'];
    public function school() { return $this->belongsTo(School::class); }
}
