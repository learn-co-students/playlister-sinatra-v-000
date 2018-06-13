class SongController < ApplicationController

  get '/songs' do
      @songs =  Song.all
       erb :'songs/index'
  end

  get '/songs/new' do
      erb :'songs/new'
  end

  post '/songs/:slug' do #or /songs/new to post to?
      @song = Song.create(:name => params['song']['name'])
      @artist = Artist.create(:name => params['song']['artist'])
      @song.artist = @artist
    #   @artist.add_genre = Genre.find_by(params['genres'])
       binding.pry
      erb :'songs/show'
  end

  get '/songs/:slug' do #may have to change the order of :slug and new
     @song = Song.find_by_slug(params[:slug])
     erb :'songs/show'
 end
end
