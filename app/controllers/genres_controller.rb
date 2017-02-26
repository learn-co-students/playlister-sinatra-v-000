class GenresController < Sinatra::Base

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

end
