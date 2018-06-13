class SongController < ApplicationController

  get '/songs' do
      @songs =  Song.all
       erb :'songs/index'
  end

  get '/songs/new' do
    #    binding.pry
       @genres = Genre.all
      erb :'songs/new'
  end

  post '/songs/new' do
      @song = Song.create(:name => params['song']['name'])
      @artist = Artist.find_by(:name => params['song']['artist'])

      if @artist == nil
          @artist = Artist.create(:name => params['song']['artist'])
          @artist.songs << @song
      elsif !@artist.songs.include?(@song)
         @artist.songs << @song
      end

      @genres = Genre.find(params['genres'])
      @song.genres << @genres
       redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     erb :'songs/show'
 end

get '/songs/:slug/edit' do
     binding.pry
     @genres = Genre.all
     @song = Song.find_by_slug(params[:slug])
     erb :'songs/edit'
 end

 post '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      @artist = Artist.find_by(:name => params['song']['artist'])

      if @artist == nil
          @artist = Artist.create(:name => params['song']['artist'])
          @song.artist = @artist
      else
          @song.artist = @artist
      end
      @song.save
      redirect to "/songs/#{@song.slug}"
  end
end
