<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class CareerQuestion extends Model
{
    protected $fillable = ['title', 'scenario', 'category', 'position', 'active'];
    protected function casts(): array { return ['active' => 'boolean']; }
    public function answers() { return $this->hasMany(CareerAnswer::class)->orderBy('position'); }
}
