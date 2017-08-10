class SongsController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/songs' do#index action
    erb :'/songs/index'
  end
 #Sinatra RESTful routes
  get '/songs/new' do#new action
    erb :'/songs/new'
  end

  get '/songs/:slug' do #show action
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    artist= Artist.find_or_create_by(name: params["Artist Name"])
    song = Song.create(name: params["Name"], artist: artist)
    song.genre_ids=params["genres"]
    song.save
    #binding.pry
    @song = song
    #binding.pry
    flash[:message] = "Successfully created song."
    #binding.pry
    redirect to("/songs/#{@song.slug}")
    #binding.pry
  end

  get '/songs/:slug/edit' do#load edit form
    #binding.pry
    @song = Song.find_by_slug params[:slug]
    erb :'/songs/edit'
  end

  post 'songs/:slug' do#edit the form
    binding.pry
    @song = Song.find_by_slug params[:slug]
  end
end
