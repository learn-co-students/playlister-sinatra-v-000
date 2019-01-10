class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find {|song| song.slug == params[:slug]}
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  patch '/songs/:slug' do
     @song = Song.find {|song| song.slug == params[:slug]}
     @song.name = params["Name"]
     @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])

     @genres = Genre.find(params[:genres])

     @song.song_genres.clear
     @genres.each do |genre|
       song_genre = SongGenre.new(:song => @song, :genre => genre)
       song_genre.save
     end
     @song.save
     flash[:message] = "Successfully updated song."
     redirect to("/songs/#{@song.slug}")
   end

   get '/songs/:slug/edit' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :"songs/edit"
  end
end
