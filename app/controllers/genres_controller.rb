class GenresController < ApplicationController

    get '/genres' do
        @songs = Song.all
    erb:'/genres/index'
    end

    get '/genres/:slug' do
        #HOW CAN THE PROGRAM RECOGNIZE :SLUG AS AN ID?
        @genre = Genre.find_by_slug(params[:slug])
    erb:'/genres/show'
    end
end
