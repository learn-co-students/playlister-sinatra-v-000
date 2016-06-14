require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  set :views, Proc.new { File.join(root, "../views/songs/") }

  get '/songs' do
    binding.pry
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do 
    @genres = Genre.all 
    erb :new
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params["slug"])
    erb :show
  end

  post '/songs' do 
    @song = Song.create(:name => params["name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params["genre.id"]
    @song.save
    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

end