class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end   


  get '/songs/new' do

    @artists = Artist.all
    @genres = Genre.all

    erb :'/songs/new'
  end
  post '/songs' do


    @song = Song.new(name: params[:song][:name])

    if !params[:artist_name].empty?
      @song.artist = Artist.create(name: params[:artist_name])
    else
      @song.artist = Artist.find(params[:song][:artist_id][0])
    end

    if !params[:genre_name].empty?
      genre = Genre.create(name: params[:genre_name])
      @song.song_genres.build(genre: genre)
    else
      binding.pry
      genre = Genre.find(params[:song][:genre_id][0])
      @song.song_genres.build(genre: genre)
    end
    @song.save

    redirect "/songs", locals: {message: "Successfully created song."}
  end

     


  get '/songs/:slug' do 
    binding.pry
    @song = Song.find_by_slug(params[:slug])

    @artist = @song.artist
 
    @genre = Genre.find(@song.song_genres[0].genre_id)

    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
 
    @artist = @song.artist
    @genre = Genre.find(@song.song_genres[0].genre_id)
    @artists = Artist.all
    @genres = Genre.all

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    if !params[:artist_name].empty?
      artist = Artist.create(name: params[:artist_name])
      @song.update(name: params[:song][:name], artist: artist)
    else
      binding.pry
      artist = Artist.find(params[:song][:artist_id][0])
      @song.update(name: params[:song][:name], artist: artist)
    end

    if !params[:genre_name].empty?
      genre = Genre.create(name: params[:genre_name])
      @song.song_genres[0].update(genre_id: genre.id)
    else

      genre = Genre.find(params[:song][:genre_id][0])
 
      @song.song_genres[0].update(genre_id: genre.id)
    end
    @song.save

    redirect "/songs/#{@song.slug}", locals: {message: "Song successfully updated."}

  end



  



end