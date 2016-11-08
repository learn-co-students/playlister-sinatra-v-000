class GenresController < ApplicationController

  get '/genres' do
    #presents user list of all songs in lib.
    #each song should be clickable link
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    # any given song's show page should have links to that song's
    #artist and each genre assoc. w/ the song.
    @genre = Genre.find_by_slug(params[:slug])
    #binding.pry
    erb :'/genres/show'
  end
end
