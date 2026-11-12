<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class CareerResponse extends Model
{
    protected $fillable = ['career_attempt_id', 'career_question_id', 'career_answer_id'];
    public function attempt() { return $this->belongsTo(CareerAttempt::class, 'career_attempt_id'); }
}
