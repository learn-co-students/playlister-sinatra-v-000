class GenresController < ApplicationController

    get '/genres' do
        #list of genres
        #each is link to show page
        erb :'genres/index'
    end

    get '/genres/:slug' do
        erb :'genres/show'
    end

end