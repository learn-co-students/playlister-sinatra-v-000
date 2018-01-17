class GenresController < ApplicationController

  get '/genres' do
      erb :genre_list
    end

    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])
        erb :show_genre
    end


end
