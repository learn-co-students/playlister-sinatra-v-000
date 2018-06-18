require 'sinatra/base'
#require 'sinatra/flash'
require 'rack-flash'
require 'pry'

class SongsController < Sinatra::Base
    enable :sessions
    #register Sinatra::Flash
    use Rack::Flash
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
          @song.artist = Artist.find_by(name: params["Artist Name"])
          if @song.artist.nil?
              @song.artist = Artist.create(name: params["Artist Name"])
          end
      else
          @song.artist = Artist.find_by(id: params["song"]["artist_id"])
      end

      song_genre = SongGenre.new
      song_genre.song_id = @song.id
      song_genre.genre_id = Genre.find_by(id: params["genres"])

      params["genres"].each do |genre_id|
          SongGenre.create(song_id: @song.id, genre_id: genre_id.to_i)
      end

      @song.save
      flash[:message] = "Successfully created song."
      redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      if !params["Artist Name"].empty?
          @song.artist = Artist.find_by(name: params["Artist Name"])
          if @song.artist.nil?
              @song.artist = Artist.create(name: params["Artist Name"])
          end
      else
          if !params["song"]["artist_id"].empty?
              @song.artist = Artist.find_by(id: params["song"]["artist_id"])
          end
      end
      if !params["genres"].nil?
          SongGenre.where(song_id: @song.id).destroy_all
          song_genre = SongGenre.new
          song_genre.song_id = @song.id
          song_genre.genre_id = Genre.find_by(id: params["genres"])

          params["genres"].each do |genre_id|
              SongGenre.create(song_id: @song.id, genre_id: genre_id.to_i)
          end
      end
      @song.save

      flash[:new_message] = "Successfully updated song."

      redirect to "songs/#{@song.slug}"
  end
end
