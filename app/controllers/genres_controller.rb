class GenresController < ApplicationController

    get '/genres' do
        #binding.pry
        @genres = Genre.all
        erb :'genres/index'
    end
end
