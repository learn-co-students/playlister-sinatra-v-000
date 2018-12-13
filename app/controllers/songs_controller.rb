

class SongsController < ApplicationController



  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

 get '/songs/new' do
   @genres = Genre.all
   erb :'/songs/new'
 end

 #create/save a new song from params
  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    #what is genre_ids? Pluralize because of the associations. AR picks up the attribute from table song_genres
    #name is not present on the song_genres table hence why you won't be able to use it in this capacity
    #song.genre_ids = params[:genres] =>correct solution with genre.id on "value" attribute.
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to ("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end


  patch '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @song.update(:name =>params["Name"], genre_ids: params[:genres])
      @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
      #binding.pry
      @song.save
      flash[:message] = "Successfully updated song."
      redirect to "/songs/#{@song.slug}"
    end

end
