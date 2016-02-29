
class SongsController < ApplicationController

  get '/songs' do
    @songs=Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song=Song.create(name: params["song"]["name"]) 
    
    if params["song"]["artist_id"]
      @song.artist_id=params["song"]["artist_id"]
    elsif !params["artist_name"].empty?
      @song.artist=Artist.create(name: params["artist_name"])
    end

    if params["genre_ids"]
      @song.genre_ids = params["genre_ids"]
    elsif !params["song"]["genre"].empty?
      @song.genres << Genre.create(name: params["song"]["genre"])
    end
    @song.save

    erb :'songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do
    @song=Song.find_by_slug(params[:slug])
# binding.pry
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song=Song.find_by_slug(params[:slug])
# binding.pry
    erb :'songs/edit'
  end

  post '/songs/:slug' do

    @song=Song.find_by_slug(params[:slug])
# binding.pry
    if !params["artist_name"].empty?
      @song.artist=Artist.create(name: params["artist_name"]) 
    else
      @song.id = params["song"]["artist_id"]
    end

    @song.genre_ids=params["song"]["genre_ids"]
    if !params["song_genre"].empty? 
      @song.genres << Genre.create(name: params["song_genre"])
    end
# binding.pry
    @song.save



    erb :'songs/show', locals: {message: "Song successfully updated."}
  end



end