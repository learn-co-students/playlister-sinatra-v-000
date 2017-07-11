class SongsController < ApplicationController

    # present the user with a list of all songs, with clickable link to song's show page.
    get '/songs' do
        @songs = Song.all

    erb :"/songs/index"
    end

    # Be able to create a new song, enter the Artist's name in a text field 
    # Genres should be presented as checkboxes
    get '/songs/new' do
        @genres = Genre.all
        @artists = Artist.all
        erb :"/songs/new"
    end
    
    # extracts the form data from the params, and create a new instance of Song
    post '/songs' do
        @song = Song.create(name: params["Name"])

    # without an existing artist creates a new artist & song
        if !params["Artist Name"].empty? 
            @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
        else
    # with an existing artist, creates a new song and associates it with artist
            @song.artist.id = params[:artists][:ids]
        end

    # create new genre & select ANY existing genres
        if !params[:genre][:name].empty? && !params[:genres][:ids].empty?
            @song.genre_ids = params[:genres][:ids]
            @song.genres << Genre.find_or_create_by(params[:genre][:name])
        
    # select ANY existing genres
        elsif !params[:genres][:ids].empty?
            @song.genre_ids = params[:genres][:ids]

    # create new genre
        elsif !params[:genre][:name].empty?
            @song.genres << Genre.find_or_create_by(params[:genre][:name])
        else
            # do something
        end
        
        @song.save

        redirect to "/songs/#{@song.slug}"
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