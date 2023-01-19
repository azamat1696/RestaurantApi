<?php


namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class VerifyApiAccess
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\JsonResponse
     */
    public function handle(Request $request, Closure $next)
    {

//        if (!($request->header('access-token')  && ($request->header('access-token') == getenv('APP_API_TOKEN'))))
//        {
//            return response()->json([
//                "Message" => "You do not access to this api.",
//                "AccessStatus" => false
//            ],403);
//        }

        // for the cors errors
        $request->headers->set('Access-Control-Allow-Origin' , '*');
        $request->headers->set('Access-Control-Allow-Methods', 'POST, GET, OPTIONS, PUT, DELETE');
        $request->headers->set('Access-Control-Allow-Headers', 'Content-Type, Accept, Authorization, X-Requested-With, Application','ip');

        return $next($request);
    }
}
