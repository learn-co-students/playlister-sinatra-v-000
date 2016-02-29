
class SongsController < ApplicationController

  get '/songs' do
    @songs=Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song=Song.find_by_slug(params[:slug])
# binding.pry
    erb :'songs/show'
  end


  post '/songs' do
# binding.pry
    @song=Song.create(name: params["song"]["name"]) 
    
    if params["song"]["artist_id"]
      @song.artist_id=params["song"]["artist_id"]
    elsif !params["artist_name"].empty?
      @song.artist=Artist.create(name: params["artist_name"])
    end
# binding.pry
    @song.save
    
    redirect "/songs/#{@song.slug}"
  end



end