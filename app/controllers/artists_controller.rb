class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/new' do
    @genres = Genre.all
    erb :'/artists/new'
  end

  post '/artists' do
    @song = Song.create(params[:song])
    @song.artist = Artist.create(params[:artist])

     redirect "songs/#{@artists.slug}"
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
end
