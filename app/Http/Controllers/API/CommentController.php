<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Comment;
use Illuminate\Support\Facades\Gate;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $comments = Comment::all();
        return response()->json($comments);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {        
        // $this->permit('comments.create');
        // if (Gate::allows('comments.create')) {
            $request->validate([
                'name' => 'required|max:255',
                'text' => 'required'
              ]);
          
              $newComment = new Comment([
                'name' => $request->get('name'),
                'text' => $request->get('text')
              ]);
          
              $newComment->save();
        // } else {
        //     abort(403); // Or redirect, or return an error response, depending on your needs
        // }
      
  
        return response()->json($newComment);
    }
  
    /**
      * Display the specified resource.
      *
      * @param  int  $id
      * @return \Illuminate\Http\Response
      */
    public function show($id)
    {
      $comment = Comment::findOrFail($id);
      return response()->json($comment);
    }
  
    /**
      * Update the specified resource in storage.
      *
      * @param  \Illuminate\Http\Request  $request
      * @param  int  $id
      * @return \Illuminate\Http\Response
      */
    public function update(Request $request, $id)
    {
      $comment = Comment::findOrFail($id);
  
      $request->validate([
        'name' => 'required|max:255',
        'text' => 'required'
      ]);
  
      $comment->name = $request->get('name');
      $comment->text = $request->get('text');
  
      $comment->save();
  
      return response()->json($comment);
    }
  
    /**
      * Remove the specified resource from storage.
      *
      * @param  int  $id
      * @return \Illuminate\Http\Response
      */
    public function destroy($id)
    {
      $comment = Comment::findOrFail($id);
      $comment->delete();
  
      return response()->json($comment::all());
    }

//     public function permit(): bool
//     {
//        switch ($this->method()) {
//            case 'POST':
//                return $this->user()->can('categories.create');
   
//                break;
   
//            case 'PUT':
//                return $this->user()->can('categories.edit');
   
//                break;
//        }
   
//        return true;
//    }
}
