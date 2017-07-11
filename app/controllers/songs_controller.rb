class SongsController < ApplicationController

    # present the user with a list of all songs 
    # Each song should be a clickable link to song's show page.

    get '/songs' do
        @songs = Songs.all

    erb :"/songs/index"
    end

    # Be able to create a new song
    # Genres should be presented as checkboxes
    # Be able to enter the Artist's name in a text field 
    # (only one Artist per song.)
    get '/songs/new' do
        binding.pry
        @genres = Genre.all

        erb :"/songs/new"
    end
    
    # extracts the form data from the params 
    # create a new instance of Song
    post '/songs' do


        redirect to "/song/:slug"
    end



    # Any given song's show page with links to song's artist and genre.
    get '/songs/:slug' do

        erb :"/songs/show"
    end

    # Be able to change everything about a song, 
    # including the genres and artist.
    get '/songs/:slug/edit' do

        erb :"/songs/edit"
    end

    patch '/songs/:slug' do
        redirect to "/songs/:slug"
    end
    
    
end