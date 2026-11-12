<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class LearningPath extends Model
{
    protected $fillable = ['career_profile_id', 'school_id', 'slug', 'title', 'description', 'estimated_minutes', 'published'];
    protected function casts(): array { return ['published' => 'boolean']; }
    public function career() { return $this->belongsTo(CareerProfile::class, 'career_profile_id'); }
    public function stages() { return $this->hasMany(PathStage::class)->orderBy('position'); }
    public function school() { return $this->belongsTo(School::class); }
    public function enrollments() { return $this->hasMany(Enrollment::class); }
    public function getRouteKeyName(): string { return 'slug'; }
}
