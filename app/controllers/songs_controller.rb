require 'sinatra/base'
require 'sinatra/flash'
require 'pry'

class SongsController < Sinatra::Base
    enable :sessions
    register Sinatra::Flash
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
      end
      song_genre = SongGenre.new
      song_genre.song_id = @song.id
      song_genre.genre_id = Genre.find_by(id: params["genres"])

      params["genres"].each do |genre_id|
          SongGenre.create(song_id: @song.id, genre_id: genre_id.to_i)
      end

      @song.save
      flash[:message] = "Successfully created song."
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
