class GenresController < ApplicationController

  get '/genres' do

    @genres = Genre.all

    erb :'/genres/index'

  end

  get '/genres/:slug' do

    words = params[:slug].gsub(/[-]/, " ").split(" ").join(" ")
    @genre = Genre.find_by(name: words)
    erb :'/genres/show'
  end

end
