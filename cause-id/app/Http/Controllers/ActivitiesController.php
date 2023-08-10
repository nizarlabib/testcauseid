<?php
 
namespace App\Http\Controllers;
 
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Races;
use App\Models\Activities;
use App\Models\Race_registrations;
use Illuminate\Support\Facades\DB;
 
class ActivitiesController extends Controller
{
    /**
     * Show the profile for a given user.
     *
     * @param  int  $id
     * @return \Illuminate\View\View
     */


     public function createActivities(Request $request)
     {
         $validator = Validator::make($request->all(), [
             'activity_picture' => 'image|mimes:svg,jpeg,png,jpg,gif|max:2048',
         ]);
 
         if ($validator->fails()) {
             return response()->json([
                 'message' => 'Validation fail',
                 'errors' => $validator->errors(),
             ], 400);
         }
 
         $activities = new Activities;
         $activities->activity_name = $request->input('activity_name');
         $activities->activity_type = $request->input('activity_type');
         $activities->activity_kilometers = $request->input('activity_kilometers');
         $activities->activity_hours = $request->input('activity_hours');
         $activities->activity_minutes = $request->input('activity_minutes');
         $activities->activity_seconds = $request->input('activity_seconds');
         $activities->activity_datetime = $request->input('activity_datetime');
         $activities->race_ids = $request->input('race_ids');
         $activities->user_id = $request->input('user_id');
 
         if ($request->hasFile('activity_picture')) {
             $image = $request->file('activity_picture');
             $imageName = time().'.'.$image->getClientOriginalExtension();
             $image->move($this->getPublicPath('images'), $imageName);
             $activities->activity_picture = $this->getPublicPath('images/'.$imageName);
         }
 
         $activities->save();
 
         return response()->json([
             'success' => true,
             'message' => 'New activities created',
             'data' => [
                 'activities' => $activities
             ]
         ]);
     }

     private function getPublicPath($path = '')
     {
         return rtrim(app()->basePath('public/' . $path), '/');
     }

    public function getAllActivitiesByUserId($id)
    {
         $activities = Activities::where('user_id', $id)->get();
 
         return response()->json([
             'status' => 'success',
             'data' => $activities
         ]);
    }

    public function delActivities(Request $request)
    {
        $activities = Activities::find($request->id);

        if (!$activities) {
            return response()->json([
                'success' => false,
                'message' => 'activities not found'
            ], 404);
        }

        $activities->delete();

        return response()->json([
            'success' => true,
            'message' => 'activities was deleted'
        ], 200);
    }

}