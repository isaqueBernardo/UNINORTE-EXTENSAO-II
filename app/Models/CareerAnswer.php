<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class CareerAnswer extends Model
{
    protected $fillable = ['career_question_id', 'label', 'scores', 'feedback', 'position'];
    protected function casts(): array { return ['scores' => 'array']; }
    public function question() { return $this->belongsTo(CareerQuestion::class, 'career_question_id'); }
}
