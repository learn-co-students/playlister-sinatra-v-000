class ArtistsController < ApplicationController
  
  get '/artist' do
    @artist = Artist.all
    erb :'/artists/index'
  end
  
  post '/artist' do
    @artist = Artist.create(params[:artist])
    if !params['artist']['name'].empty?
        @artist.artist = Artist.create(name: params['song']['name'])
    end
  end
end
