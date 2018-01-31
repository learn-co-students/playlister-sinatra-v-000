require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash

  post '/songs' do
    @song = Song.new(name: params["Name"], genre_ids: params["genres"])
    if params["Artist Name"] != "" || params["Artist Name"] != nil 
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])    
    end
    @song.save
     flash[:message] = "Successfully created song."
     redirect("/songs/#{@song.slug}")
  end

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Song
    erb :'/songs/new'
  end

  get '/songs/:slug' do
 
    @song = Song.find_by_slug(params[:slug])
    #  binding.pry
    erb :'/songs/show'
  end

  get "/songs/:slug/edit" do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])

    erb :"/songs/edit"
  end

  patch "/songs/:slug" do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.update(name: params[:Name])
    # binding.pry
    flash[:message] = "Successfully updated song."
     redirect to("/songs/#{@song.slug}")
  end

end