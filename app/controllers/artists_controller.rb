class ArtistsController < ApplicationController
  
  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  post '/artists' do
    erb :index
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params["slug"])
    @artist_genres = [] 
    @artist.songs.each do |as| 
    @artist_genres << SongGenre.find_by(song_id = as.id)
    end 
      @artist_genres
    erb :'/artists/show'
  end
end