class SongsController < ApplicationController
   
    use Rack::Flash

    get '/songs' do 
        @songs = Song.all
        erb :'/songs/songs'
    end

    get '/songs/new' do 
        @artists = Artist.all
        @genres = Genre.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    post '/songs' do
        @song = Song.create(params['song'])
        if !params['artist']['name'].empty? 
            @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
        end
        @song.genre_ids = params['genre']
        @song.save
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :edit
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(name: params['song']['name'])
        if !params['artist']['name'].empty? 
            artist = Artist.find_by_slug(params['artist'])
            @song.artist = Artist.create(name: params['artist']['name'])
        end
        @song.genre_ids = params['genres']
        @song.save
        flash[:message] = "Successfully edited song."
        redirect "/songs/#{@song.slug}"
    end

end