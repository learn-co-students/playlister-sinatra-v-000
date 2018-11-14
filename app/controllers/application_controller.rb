class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  helpers do
    def all_songs
      Song.all
    end

    def current_song
      Song.find_by_slug(params[:slug])
    end

    def all_artists
      Artist.all
    end

    def current_artist
      Artist.find_by_slug(params[:slug])
    end

    def all_genres
      Genre.all
    end

    def current_genre
      Genre.find_by_slug(params[:slug])
    end
  end
end
