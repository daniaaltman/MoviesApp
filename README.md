#  MoviesApp
---


This is an iOS app for browsing movies. It has `Main` as the storyboard and it comes down to three main components(which among them there are two scenes):
* [Navigation Controller](#navigation-controller)
* [ViewController scene](#viewcontroller-scene)
* [MovieInfo scene](#moviesinfo-scene)


## Navigation Controller
I use the navigation controller to transition between the two scenes.


## ViewController scene
This is the entrypoint scene. It is used to show the list of movies. 
It also makes the call to the movies API and fetch the results. It also contains a search feature to filter the queried movies according to name.

## MovieInfo Scene
 This scene shows the movie's information - it's title, release date, poster, ranking and & overview.