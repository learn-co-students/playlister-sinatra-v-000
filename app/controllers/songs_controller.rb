class SongsController < ApplicationController

  get '/' do

  end

  get '/songs' do
    #presents user list of all songs in lib.
    #each song should be clickable link

  end

  get '/songs/:slug' do
    # any given song's show page should have links to that song's
    #artist and each genre assoc. w/ the song.

  end

  get '/songs/new' do
    #be able to create new song
    #genres should be presented as checkboxes
    #be able to enter artist's name in text field(1 per song)
  end

  get '/songs/:slug/edit' do
    #be able to change everything about song, including
    #genres associated w/it and its artist. think about custom
    #writer or writers you may need to write to make work.
  end
end
