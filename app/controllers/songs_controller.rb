
# require 'sinatra/base'
# require 'rack-flash'
#

class SongsController < ApplicationController
    use Rack::Flash
  # get '/' do
  #   @songs = Song.all
  #   erb :'songs/index'
  #
  # end

  get '/songs' do
    # binding.pry
    @songs = Song.all
    erb :'songs/index'
    # @songs = Song.all
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
# binding.pry
    @song = Song.create(params[:song])
    @song.name = params["Name"]
    # @song.artist = params["Artist Name"]
    @song.genres <<  Genre.find(params[:genres][0].to_i)

    if !params["Artist Name"].empty?
      if Artist.find_by_name(params["Artist Name"])
        @song.artist = Artist.find_by_name(params["Artist Name"])
      else
        @song.artist = Artist.create(name: params["Artist Name"])
      end
    end

    @song.save
    # binding.pry
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'

  end


  get '/songs/:slug' do
    # binding.pry
    flash[:message] = "Successfully created song."
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


  post '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(:slug)
    erb :'songs/:slug'
  end


end
