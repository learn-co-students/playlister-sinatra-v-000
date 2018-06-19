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
    #   binding.pry
      @song = Song.find_by(:name => params['song']['name'])

      if @song == nil
          @song = Song.create(:name => params['song']['name'])
      end
      #song made
      @artist = Artist.find_by(:name => params['song']['artist'])

      if @artist == nil
          @artist = Artist.create(:name => params['song']['artist'])

      end

       @artist.songs << @song
      @genres = Genre.find(params['genres'])
      @song.genres.clear

      @song.genres << @genres
      @song.save
      flash[:message] = "Successfully created song."
    #   erb :'songs/show'
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do

     @song = Song.find_by_slug(params[:slug])
    #  binding.pry
     erb :'songs/show'
 end

get '/songs/:slug/edit' do
    #  binding.pry
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
       @genre = Genre.find(params['genres'])
       @song.genres << @genre
      @song.save
    #   binding.pry
       flash[:message] = "Successfully updated song."
       redirect to "songs/#{@song.slug}"
    #    erb :'songs/show'
  end

end
