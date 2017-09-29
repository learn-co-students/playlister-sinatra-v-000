require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do # route is GET request to localhost:9393/songs to display all songs
    @all_songs = Song.all
    # store array of all song instances in @all_songs instance variable to pass to view file
    erb :'songs/index' # render the index.erb view file that is within the songs/ subfolder within views/ folder
  end

  get '/songs/new' do # route is GET request to localhost:9393/songs/new, where user will see a form to create a new song
    erb :'songs/new' # render the new.erb view file, which is found within the songs/ subfolder within the views/ folder
  end
# show action below to display info about a single song:
  get '/songs/:slug' do # route is GET request to localhost:9393/songs/slugified-version-of-@name-attribute-value-of-song-instance-goes-here
    @song = Song.find_by_slug(params[:slug]) # song instance stored in @song instance variable to pass to view
    # :slug is key in params hash because it's a route variable
    # route variable :slug is replaced by params[:slug] = slugified version of @name attribute value of song instance, which is returned by calling #slug instance method on song instance
    erb :'songs/show' # render the show.erb view file, which is found in songs/ subfolder within views/ folder
  end

  post '/songs' do # route is a POST request to localhost:9393/songs. Route receives the data submitted in the form to create a new song.
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params["genres"]
    @song.save

    flash[:message] = "Successfully created song."

    redirect("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do # route is GET request to localhost:9393/slugified-@name-of-song-instance-goes-here/edit to present form to edit song
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit' # render the edit.erb view file, which is found in songs/ subfolder within views/ folder
  end

  patch '/songs/:slug' do # Editing a single song - route is a PATCH request to localhost:9393/songs/slugified version of @name attribute of song instance goes here
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song]) # params[:song] is the song hash (nested inside params hash) containing info about a song (@name of song instance and array of @id values of genre instances belonging to it). We call #update on @song instance and pass in song hash. Attributes are assigned to the @song instance through mass assignment, (some attribute values may have been edited), and the song instance's row representation is updated in songs database table
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save

    flash[:message] = "Successfully updated song."

    redirect("/songs/#{@song.slug}") # redirect to the show page to show the song that was just edited
  end
end

# Explanation of post '/songs' do route to create a new song instance
# Instantiate and save to DB a song instance with its @name attribute value = to params["Name"]
# The "Name" key of params hash points to the @name attribute value of song instance (i.e. whatever user submitted in Name form field when creating a new song)
# Store the song instance in @song instance variable to pass to the view file
# Check to see if the user chooses an existing artist instance or creates a new artist for the new song to belong to:
# The "Artist Name" key of params hash points to whatever the user entered in the Artist Name form field,
# which equals the @name attribute value of the artist instance that we will either find by its @name attribute value or create (and save to DB) with this @name attribute value set, if such an artist instance does not already exist
# The AR method #find_or_create_by(attribute_hash) finds and returns the first record (instance) with the specified attributes, or creates a record with the attributes set if one is not found
# Tell the @song instance that it belongs to the artist instance that we just found or created by
# calling the #artist= AR method on the @song instance to set its @artist property = the artist instance to which it belongs
# When a user indicates which genre(s) the new song belongs to by checking a genre checkbox,
# the @id attribute value(s) of the genre instance(s) get sent through to the params hash:
# params["genres"] is an array of @id attribute values of genre instances to which the song instance belongs (genre.id --the value of the value property of a checkbox <input>-- is passed through to params hash when form is submitted with that checkbox checked)
# Calling #genre_ids on a song instance returns the array of @id attribute values of the genre instances to which the song instance belongs
# We tell the song instance what genre instance(s) it belongs to by saying @song.genre_ids = params["genres"]
# Then we're able to call #genres on the song instance to return the array of actual genre instances it belongs to
# @song.save updates the new associations in the database
# the browser navigates to the show page to show the song that was just created. #slug called on the @song instance returns its slugified @name attribute value, which we then interpolate into the show page URL string

# Continued explanation of patch '/songs/:slug' do route to edit song instance:
# We find or create an artist instance by the specified @name attribute value:
# The "artist" top-level key of params hash points to (and stores) the artist hash containing info about an artist instance, and
# the "name" key of this artist hash that's nested inside of the params hash points to the @name attribute value of an artist instance
# params[:artist][:name] is therefore the @name attribute value of an artist instance
# we tell the @song instance that it belongs to the artist instance found or created with the specified @name value
# by calling #artist= on the @song instance to set its @artist property = artist instance to which it belongs
# we call #save on @artist instance to update info about its associations, which may have been edited
