class GenresController < ApplicationController
    
    get '/genres' do #index
        @genres = Genre.all
        erb :"/genres/index"
    end

    get '/genres/:slug' do #show
        @genre = Genre.find_by_slug(params[:slug]) 
        erb :"/genres/show"
    end


end 