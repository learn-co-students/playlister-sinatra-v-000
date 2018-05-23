class GenresController < ApplicationController
  get '/genres' do
    @all_gen = Genre.all
    erb :'/genres/index'
  end

  get "/genres/:slug" do
    @genre = Genre.find_by_slug(params[:slug])
    if @genre
      erb :'/genres/show'
    else
      redirect to "/genres"
    end
  end
end
