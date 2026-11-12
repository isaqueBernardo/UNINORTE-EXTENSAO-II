<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class School extends Model
{
    protected $fillable = ['name', 'code', 'city', 'state', 'active'];
    protected function casts(): array { return ['active' => 'boolean']; }
    public function classrooms() { return $this->hasMany(Classroom::class); }
    public function users() { return $this->hasMany(User::class); }
}
