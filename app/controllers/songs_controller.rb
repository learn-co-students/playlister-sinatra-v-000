require_relative '../../config/environment'
require 'pry'
require 'rack-flash'

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions
  use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(params["song"])

    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(params["artist"])
      @song.save
    end

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end


end
