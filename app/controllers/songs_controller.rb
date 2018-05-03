class SongsController < ApplicationController
    enable :sessions
    use Rack::MethodOverride
    use Rack::Flash
  
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end
    
    get '/songs/new' do
        erb :'/songs/new'
    end
    
    post '/songs' do
        @song = Song.create(params[:song])
        @song.artist = Artist.find_or_create_by(params[:artist])
        params[:genres].each {|genre| @song.genres << Genre.find(genre) }
        @song.save
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end
    
    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(name: params[:song])
        @song.artist.update(name: params[:artist])
        @song.save
        flash[:message] = "Successfully updated song."
        erb :"/songs/show"
    end
    
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end
    
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/edit'
    end
    
end
