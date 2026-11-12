<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class CareerProfile extends Model
{
    protected $fillable = ['slug', 'name', 'description', 'icon', 'accent', 'skills', 'starter_projects', 'active'];
    protected function casts(): array { return ['skills' => 'array', 'starter_projects' => 'array', 'active' => 'boolean']; }
    public function paths() { return $this->hasMany(LearningPath::class); }
}
