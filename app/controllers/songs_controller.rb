class SongsController < ApplicationController
  get '/songs' do 
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do 
    erb :"/songs/new"
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs' do 
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    end
    @song.genres = Genre.find(params[:genres])
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end
  
  patch '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    if !params[:song].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist])
    end
    #@song.update(genres: Genre.find(params[:genre]))
    @song.update(params["song"])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end 
