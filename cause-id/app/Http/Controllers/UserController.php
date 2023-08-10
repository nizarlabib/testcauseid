<?php
 
namespace App\Http\Controllers;
 
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Race_registrations;
use App\Models\Races;
use App\Models\Activities;
 
class UserController extends Controller
{
    /**
     * Show the profile for a given user.
     *
     * @param  int  $id
     * @return \Illuminate\View\View
     */
    public function getUserById($id)
    {
        $users = User::where('id', $id)->first();

        if (!$users) {
            return response()->json([
                'status' => false,
                'message' => 'user not found'
            ]);
        }
        return response()->json([
            'status' => 'success',
            'data' => $users
        ]);
    }

    public function getRacesByUserId($id)
    {
        $usersRaces = DB::table('users')
            ->where('users.id', $id)
            ->join('race_registrations', 'users.id', '=', 'race_registrations.user_id')
            ->join('races', 'race_registrations.race.id', '=', 'races.id')
            ->select('users.*', 'races.race_name')
            ->get();

        
        return response()->json([
            'status' => 'success',
            'data' => $usersRaces
        ]);
    }

    
    public function joinRace(Request $request)
    {
        $raceregistrations = Race_registrations::create([
            'user_id' => $request->input('user_id'),
            'race_id' => $request->input('race_id'),
            'registration_jerseysize' => $request->input('registration_jerseysize')
        ]);

        return response()->json([
            'success' => true,
            'message' => 'success added user to race',
            'data' => [
                'raceregistrations' => $raceregistrations
            ]
        ]);
    }
}