class GenresController < ApplicationController
  get '/genres/new' do
    @genres = Genre.all
    erb :'/genres/new'
    end

    post '/genres' do
    genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
    end

    get "/genres/:id" do
      @genre = Genre.find_by_slug(params[:slug])
      erb :"genres/#{@genre.id}"
    end

end
