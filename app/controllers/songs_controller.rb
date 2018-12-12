class SongsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


    get '/songs' do
      # binding.pry
      @songs = Song.all
      erb :'songs/index'
    end

    get '/songs/new' do
      @songs = Song.all
      @artists = Artist.all
      @genres = Genre.all
      erb :'/songs/new'
    end

    get '/songs/:slug' do
      # binding.pry
      slug = params[:slug]
      @song = Song.find_by_slug(slug)
      @genres = Genre.all
      erb :'songs/show'
    end


    post '/songs' do
      binding.pry
      @song = Song.create(name: params[:song][:name])
      @artist = Artist.create(params)
      @genres = Genre.create(params)
      erb :'/songs/'
    end


end
