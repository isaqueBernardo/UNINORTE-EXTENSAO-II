<?php
namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    protected $fillable = ['school_id', 'classroom_id', 'name', 'email', 'password', 'role', 'xp', 'is_active'];
    protected $hidden = ['password', 'remember_token'];
    protected function casts(): array { return ['password' => 'hashed', 'email_verified_at' => 'datetime', 'is_active' => 'boolean']; }
    public function school() { return $this->belongsTo(School::class); }
    public function classroom() { return $this->belongsTo(Classroom::class); }
    public function attempts() { return $this->hasMany(CareerAttempt::class); }
    public function enrollments() { return $this->hasMany(Enrollment::class); }
    public function certificates() { return $this->hasMany(Certificate::class); }
    public function isStaff(): bool { return in_array($this->role, ['teacher', 'admin'], true); }
}
