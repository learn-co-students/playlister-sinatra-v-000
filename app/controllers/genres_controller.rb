class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all.sort_by{|genre| genre.name}
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @artists = @genre.artists.sort_by{|artist| artist.name}
    @songs = @genre.songs.sort_by{|song| song.name}

    erb :'genres/show'
  end
end
