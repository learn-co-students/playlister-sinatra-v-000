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
    @song = Song.create(name: params[:Name])
    @song.artist = Artist.find_or_create_by(name: params[:"Artist Name"])
    binding.pry
    @song.genres = Genres.find(params[:genres])
    @song.save
    binding.pry
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end

end
