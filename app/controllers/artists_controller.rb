class ArtistsController < ApplicationController

  get '/artists' do
    erb :'/songs/index'

  end

  get '/artists/:slug' do
    erb :'songs/show'

  end

end
