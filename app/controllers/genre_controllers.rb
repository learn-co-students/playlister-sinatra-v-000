class GenreControllers < ApplicationController
  get '/genres' do
    erb :'genres/view_all'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/view'
  end
end
