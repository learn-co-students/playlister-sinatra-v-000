class GenresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/genres/") }

  get '/genres' do
    @genres = Genre.all
    erb :index
  end

  get '/genres/:slug' do 
    @genre = Genre.find_by_slug(params["slug"])
    @songs = @genre.songs.all
    @artists = @genre.artists.all 
    erb :show
  end

end