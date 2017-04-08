class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  set :method_override, :true
  set :database, "sqlite3:db/#{ENV['SINATRA_ENV']}.sqlite"
  use Rack::Flash, :sweep => true

  get '/' do
    erb :index
  end

  helpers do

    def all_artists
      Artist.all
    end

    def all_songs
      Song.all
    end

    def all_genres
      Genre.all
    end
  end
end
