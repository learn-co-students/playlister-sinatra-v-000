class SongsController < ApplicationController 

    enable :sessions
    use Rack::Flash


    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do
        @artists = Artist.all
        erb :'songs/new'
    end

    post '/songs' do
        @song = Song.create(params["song"])

        params["genres"].each{|id| @song.genres << Genre.find(id)}

        if !params["artist"]["name"].empty?
            artist = Artist.find_by(name: params["artist"]["name"]) || Artist.create(name: params["artist"]["name"]) 
            @song.artist = artist
        end

        if params["genre"]["name"] != nil 
            obj = Genre.find_by(name: params["genre"]["name"]) || Genre.create(name: params["genre"]["name"])
            @song.genres << obj
        end

        @song.save
        flash[:message] = "Successfully created song."

        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

end