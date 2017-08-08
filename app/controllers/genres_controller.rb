class GenresController < ApplicationController
<<<<<<< HEAD
=======
  get '/genres' do
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

>>>>>>> 19267d145817a0a775bfacdb683856257c6235f7
end
