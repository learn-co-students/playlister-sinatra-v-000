class SongController < ApplicationController

  get '/songs' do
      @songs =  Song.all
       erb :'songs/index'
  end

  get '/songs/new' do
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
      flash[:message] = "Successfully created song."
    #   erb :'songs/show'
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do

     @song = Song.find_by_slug(params[:slug])
     erb :'songs/show'
 end

get '/songs/:slug/edit' do
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
      ###check if the params holds the the ids and delete if they are not present in params but are in the hash-pramas
      binding.pry
      if !@song.genres.include?(@genre)
          @song.genres << @genre
          binding.pry
      end
      @song.save
       flash[:message] = "Successfully updated song."
       redirect to "songs/#{@song.slug}"
    #    erb :'songs/show'
  end
end
