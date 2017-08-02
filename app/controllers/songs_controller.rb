require 'pry'
require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end


    get '/songs/:slug' do
      # 500 error??????????????????????
      @song = Song.find_by_slug(params[:slug])

      erb :'songs/show'
    end

  post '/songs' do
     @song = Song.create(:name => params["Name"])
     @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])

     @song.genre_ids = params[:genres]  #??????
     @song.save

# binding.pry
     flash[:message] = "Successfully created song."

      redirect to "/songs/#{@song.slug}"
      # raise params.inspect
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    # @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    # params["Artist Name"]
    @song.update(params[:song])
    @song.save
    # binding.pry

    flash[:message] = "Successfully updated song."

    redirect to "/songs/#{@song.slug}"
  end


end
