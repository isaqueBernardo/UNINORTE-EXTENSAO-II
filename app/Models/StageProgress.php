<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class StageProgress extends Model
{
    protected $table = 'stage_progress';
    protected $fillable = ['enrollment_id', 'path_stage_id', 'answer', 'attempts', 'completed_at'];
    protected function casts(): array { return ['completed_at' => 'datetime']; }
}
