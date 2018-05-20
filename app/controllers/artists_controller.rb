class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(:slug).first # <<-- find_by_slug is reporting ALL artists for some reason
    @song_genres = SongGenre.all
    erb :'/artists/show'
  end

  delete '/artists/:slug/delete' do
    @artist = Artist.find_by_slug(params[:slug])
    @artist.delete
    redirect to '/artists'
  end

end

# rspec spec/features/04_basic_view_spec.rb
