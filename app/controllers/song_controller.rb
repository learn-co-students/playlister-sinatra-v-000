class SongController < ApplicationController

  # This should present the user with a list of all songs in the library.
  # Each song should be a clickable link to that particular song's show page.
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  # Display the new song form with selectable genres
  get '/songs/new' do
    @genres = Genre.all
    erb :"/songs/new"
  end

  post '/songs' do
    
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  #
  # /songs/:slug
  # Any given song's show page should have links to that song's artist and the each genre associated with the song.
  # Pay attention to the order of /songs/new and /songs/:slug. The route /songs/new could interpret new as a slug if that controller action isn't defined first.
  #
  # post '/songs' do
  # # ...
  # # ^ code for creating and saving a new song
  # flash[:message] = "Successfully created song."
  # redirect to("/songs/#{@song.slug}")
  # end


end
