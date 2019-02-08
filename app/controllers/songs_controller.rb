class SongsController < ApplicationController
	get '/songs' do
    @songs = Song.all
    erb :'/songs/index' 
  end

  get '/songs/new' do 
    @artists = Artist.all
    erb :'/songs/new'
  end

  post '/songs' do 
    @song = Song.new(name: params[:song][:name]) 
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    params[:song][:genres].each {|genre_id| @song.genres << Genre.find(genre_id) }
    @song.save
    flash[:message] = "Successfully created new song: #{@song.name}."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])

    if @song.genres
      @song.genres.clear
    end
    
    params[:song][:genres].each {|genre_id| @song.genres << Genre.find(genre_id) }
    @song.save
    flash[:message] = "Successfully updated song: #{@song.name}."
    redirect to "/songs/#{@song.slug}"
  end
end