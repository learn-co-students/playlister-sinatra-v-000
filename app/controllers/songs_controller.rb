class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
end


# Any given song's show page should have links to that song's artist and the each genre associated with the song.
# Pay attention to the order of /songs/new and /songs/:slug. The route /songs/new could interpret new as a slug if
#  that controller action isn't defined first.
