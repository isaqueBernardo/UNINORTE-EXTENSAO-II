<?php
namespace App\Http\Controllers;

use App\Models\Certificate;
use Illuminate\Http\Request;

class CertificateController extends Controller
{
    public function show(Certificate $certificate, Request $request)
    {
        abort_unless($request->user()->id === $certificate->user_id || $request->user()->role === 'admin' || ($request->user()->role === 'teacher' && $certificate->user->school_id === $request->user()->school_id), 403);
        $certificate->load('user.school', 'enrollment.path');
        return view('certificates.show', compact('certificate'));
    }
    public function verify(string $code)
    {
        $certificate = Certificate::where('verification_code', $code)->with('user', 'enrollment.path')->first();
        $valid = (bool) $certificate;
        $studentInitials = $valid ? implode(' ', array_map(fn ($word) => mb_substr($word, 0, 1).'.', preg_split('/\s+/', trim($certificate->user->name)))) : null;
        return view('certificates.verify', compact('certificate', 'valid', 'studentInitials'));
    }
}
