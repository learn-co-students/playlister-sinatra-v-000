require 'rack-flash'


class GenresController < ApplicationController

  use Rack::Flash

  get '/genres' do
    @genress = Genre.all
    erb :'/genres/show'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/:slug'
  end



end
