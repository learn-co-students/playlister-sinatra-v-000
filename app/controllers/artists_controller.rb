class ArtistsController < ApplicationController

  get '/artists' do
    #presents user list of all songs in lib.
    #each song should be clickable link
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    # any given song's show page should have links to that song's
    #artist and each genre assoc. w/ the song.
    @artist = Artist.find_by_slug(params[:slug])
    #binding.pry
    erb :'/artists/show'
  end

end
