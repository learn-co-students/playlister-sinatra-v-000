class SongGenresController < Sinatra::Base

  get '/' do
    erb :index
  end
end
