class SongsController < ApplicationController
 
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  
  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    redirect to("/songs/#{@song.slug}")
  end
  
  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end
  
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    if !@song.genres.include?(Genre.find(params["genres"][0].to_i))
      @song.genres << Genre.find(params["genres"][0].to_i)
    end
    @song.name = params["Song Name"]
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(:slug)
    @song.save
    erb :'songs/:slug'
  end

end
