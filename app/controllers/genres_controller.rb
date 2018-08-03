class GenresController < ApplicationController

get '/genres' do
  @genres = Genres.all
  erb :'/genres/index'
end

end
