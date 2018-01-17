class SongsController < ApplicationController

  get '/songs' do
    # This should present the user with a list of all songs in the library.
    # Each song should be a clickable link to that particular song's show page.
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    # Any given song's show page should have links to that song's artist and the each genre associated with the song.
    # Pay attention to the order of /songs/new and /songs/:slug. The route /songs/new could interpret new as a slug if that controller action isn't defined first.
    erb :'songs/show'
  end



end
