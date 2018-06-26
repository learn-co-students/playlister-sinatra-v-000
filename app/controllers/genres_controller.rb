class GenresController < ApplicationController

  get '/genres' do
    erb :'songs/index'
  end

end
