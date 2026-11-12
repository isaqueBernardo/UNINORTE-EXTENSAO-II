<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class PathStage extends Model
{
    protected $fillable = ['learning_path_id', 'position', 'title', 'description', 'lesson', 'mission_type', 'mission_prompt', 'options', 'correct_option', 'xp_reward', 'estimated_minutes'];
    protected function casts(): array { return ['options' => 'array']; }
    public function path() { return $this->belongsTo(LearningPath::class, 'learning_path_id'); }
}
