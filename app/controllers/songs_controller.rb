class SongController < ApplicationController

  get '/songs' do
      @songs =  Song.all
       erb :'songs/index'
  end

  get '/songs/new' do
    #   binding.pry
      erb :'songs/new'
  end

  post '/songs/new' do #or /songs/new to post to?
      @song = Song.create(:name => params['song']['name'])
      @artist = Artist.create(:name => params['song']['artist'])

      @artist.songs << @song
      @genres = Genre.find_by(params['genres'])
      @song.genres << @genres
      binding.pry
       redirect to '/songs/<%=@song.slug%>'
  end

  get '/songs/:slug' do #may have to change the order of :slug and new
      binding.pry
     @song = Song.find_by_slug(params[:slug])
      binding.pry
     erb :'songs/show'
 end

end
