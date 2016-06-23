class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    binding.pry
    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song = Song.create(name: params[:song][:name])
    @song.artist = @artist

    # iterate through genre ids and add these to the song_genres join table
    params[:song][:genre_ids].each do |id|
      genre = Genre.find(id)
      # trying to build out the join table relationship
      # @song.song_genres.build(genre: genre)

      SongGenre.create(song_id: @song.id, genre_id: genre.id) #didn't seem to work
    end

    @song.save
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    #new song!
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


end
