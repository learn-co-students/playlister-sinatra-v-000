class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/songlist'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song_name])
    @song.artist = Artist.find_or_create_by(name: params[artist_name])
    #params[:genres] # => [1,2,3]
     # [1 ,2 ,3]
    #@song.genres # => [] or [ <# Genre >, <#Genre>]
    #@song.genre_ids = params[:genres]

      # genre.name
#    #@genre = Genre.create(name: pa )

    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artists = @song.artist
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    erb :'songs/edit'
  end

end
