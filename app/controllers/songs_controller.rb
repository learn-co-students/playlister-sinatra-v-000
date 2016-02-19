class SongsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/songs") }

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs' do
   #code to create a new song and save to DB
   @song = Song.find_or_create_by(name: params[:song][:name])
   @song.artist = Artist.find_or_create_by(name: params[:song][:artist_name])
   @song.genres = params[:song][:genre_ids]
   @song.save
   redirect to "/songs", locals: {message: "Successfully created song."}

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :edit
  end

  patch '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    @song.genres =[]
      params[:song][:genre_ids].each do |genre|
        @song.genres << Genre.find(genre)
    end
    @song.save
    erb :show, locals: {message: "Song successfully updated."}


  end
end