<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class CareerAttempt extends Model
{
    protected $fillable = ['user_id', 'status', 'result_career_id', 'scores', 'question_ids', 'completed_at'];
    protected function casts(): array { return ['scores' => 'array', 'question_ids' => 'array', 'completed_at' => 'datetime']; }
    public function user() { return $this->belongsTo(User::class); }
    public function resultCareer() { return $this->belongsTo(CareerProfile::class, 'result_career_id'); }
    public function responses() { return $this->hasMany(CareerResponse::class); }
}
