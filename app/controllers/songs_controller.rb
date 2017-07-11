class SongsController < ApplicationController

    # present the user with a list of all songs 
    # Each song should be a clickable link to song's show page.

    get '/songs' do
        @songs = Song.all

    erb :"/songs/index"
    end

    # Be able to create a new song
    # Genres should be presented as checkboxes
    # Be able to enter the Artist's name in a text field 
    # (only one Artist per song.)
    get '/songs/new' do
        @genres = Genre.all

        erb :"/songs/new"
    end
    
    # extracts the form data from the params 
    # create a new instance of Song
    post '/songs' do
        @song = Song.create(params[:song])

        if !params[:artist][:name].empty?
        @song.artist = Artist.find_or_create_by(params[:artist])
        else
        @song.genre_ids = params[:genres]
        end
        @song.save

        redirect to "/song/:slug"
    end

    # Any given song's show page with links to song's artist and genre.
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
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