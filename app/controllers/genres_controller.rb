class Genrescontroller < ApplicationController


  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.all.detect{|obj|obj.slug == params[:slug]}
    erb :'genres/show'
  end

end
