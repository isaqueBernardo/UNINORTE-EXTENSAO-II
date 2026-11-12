<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Enrollment extends Model
{
    protected $fillable = ['user_id', 'learning_path_id', 'completed_at'];
    protected function casts(): array { return ['completed_at' => 'datetime']; }
    public function user() { return $this->belongsTo(User::class); }
    public function path() { return $this->belongsTo(LearningPath::class, 'learning_path_id'); }
    public function progress() { return $this->hasMany(StageProgress::class); }
    public function certificate() { return $this->hasOne(Certificate::class); }
}
