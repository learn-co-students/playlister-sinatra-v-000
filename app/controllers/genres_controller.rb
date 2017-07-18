class GenresController < ApplicationController

  get '/genres' do
    @category = Genre
    erb :show_category
  end

  get '/genres/:slug' do
    if Genre.find_by_slug(params[:slug])
      @item = Genre.find_by_slug(params[:slug])
      erb :show_item
    end

  end

end