
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all.order(:name)

    erb :"songs/index"
  end

  post '/songs' do

    @artist = Artist.find_or_create_by(name: params[:"Artist Name"])
    @song = Song.create(name: params[:Name], artist_id: @artist.id)
    @new_genre = Genre.create(name: params[:new_genre_name]) if not params[:new_genre_name].empty?

    genre_ids = params[:genres]
    genre_ids << @new_genre.id

    @song.genre_ids = genre_ids

    erb :'songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  post '/songs/:slug' do
    @artist = Artist.find_or_create_by(name: params[:"Artist Name"])
    @song = Song.find_by_id(params[:song_id])
    @new_genre = Genre.create(name: params[:new_genre_name]) if not params[:new_genre_name].empty?

    genre_ids = params[:genres]
    genre_ids << @new_genre.id

    @song.update(
      name: params[:Name],
      artist_id: @artist.id,
      genre_ids: genre_ids
    )

    erb :'songs/#{@song.slug}', locals: {message: "Song successfully updated."}
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

end
