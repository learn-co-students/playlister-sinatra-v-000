class SongsController < ApplicationController

    get '/songs' do
        #binding.pry
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/:slug' do
        ##@song = Song.find_by_slug(params[:slug])
        #@artist = @song.artist
        ##erb :'/songs/show'
    end

    #post '/songs' do
    #    @song = Song.create(name: params[:name])
    #    if !params[:genres].empty?
    #        @song.genre_ids = params[:genres]
    #        @song.save
    #    end
    #@artist = Artist.find_or_create_by
    #    flash[:notice] = "You've successfully done something!"
    #end

end
