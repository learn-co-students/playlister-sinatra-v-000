require 'pry'

class SongsController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
      erb :'songs/new'
  end

  post '/songs' do
      @song = Song.create(name: params["Name"])
      if !params["Artist Name"].empty?
          @song.artist = Artist.create(name: params["Artist Name"])
          @song.artist.save
      end
      @song.save
      binding.pry
      redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    erb :'songs/edit'
  end



end
