<?php
 
namespace App\Http\Controllers;
 
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Races;
use App\Models\Activities;
use App\Models\Race_registrations;
use Illuminate\Support\Facades\DB;
 
class RacesController extends Controller
{
    /**
     * Show the profile for a given user.
     *
     * @param  int  $id
     * @return \Illuminate\View\View
     */


    public function getAllRaces($id)
    {
        $races = DB::table('races')
            ->leftJoin('race_registrations', 'races.id', '=', 'race_registrations.race_id')
            ->leftjoin('users', 'race_registrations.user_id', '=', 'users.id')
            ->select('races.*', DB::raw('IF(users.id IS NOT NULL, "Terdaftar", "Belum Terdaftar") as status'))
            ->get();

    

        if (!$races) {
            return response()->json([
                'status' => false,
                'message' => 'races not found'
            ]);
        }
        return response()->json([
            'status' => 'success',
            'data' => $races
        ]);
    }

    public function getRaceById($id)
    {
        $race = Races::where('id', $id)->first();

        if (!$race) {
            return response()->json([
                'status' => false,
                'message' => 'race not found'
            ]);
        }
        return response()->json([
            'status' => 'success',
            'data' => $race
        ]);
    }

    public function getRaceByUserId($id)
    {
        $userRaces = DB::table('races')
            ->join('race_registrations', 'races.id', '=', 'race_registrations.race_id')
            ->join('users', 'race_registrations.user_id', '=', 'users.id')
            ->select('races.*')
            ->where('users.id', $id)
            ->get();

        if (!$userRaces) {
            return response()->json([
                'status' => false,
                'message' => 'race not found'
            ]);
        }
        return response()->json([
            'status' => 'success',
            'data' => $userRaces
        ]);
    }

    public function getProgressRaceByUserId($id)
    {
        $userRaces = DB::table('races')
            ->join('race_registrations', 'races.id', '=', 'race_registrations.race_id')
            ->join('users', 'race_registrations.user_id', '=', 'users.id')
            ->join('activities', 'activities.race_ids', '=', 'races.id')
            ->select('activities.activity_kilometers', 'races.race_name', 'races.race_finishkilometer',DB::raw('activities.activity_kilometers / races.race_finishkilometer * 100 AS progress_races'))
            ->where('users.id', $id)
            ->get();

        if (!$userRaces) {
            return response()->json([
                'status' => false,
                'message' => 'race not found'
            ]);
        }
        return response()->json([
            'status' => 'success',
            'data' => $userRaces
        ]);
    }

}