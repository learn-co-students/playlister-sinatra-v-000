require 'rack-flash'
class SongsController < ApplicationController
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
    song = Song.create(name: params[:song_name], artist: artist)
    song.genre_ids=params[:genre]
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
    #binding.pry
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do#edit the form
    #binding.pry
    @song = Song.find_by_slug params[:slug]
    @song.update(artist: Artist.find_or_create_by(:name => params["Artist Name"]), genre_ids: params["genres"], :name => params["Name"])
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end
end
