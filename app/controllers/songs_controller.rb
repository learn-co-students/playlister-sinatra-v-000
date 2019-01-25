class SongsController < ApplicationController

  get '/songs' do
    # Present the user with a list of songs in the library
    # Each song should be a clickable link to that particular song's show page
    erb :'/songs/index'
  end

  get '/songs/new' do
    
    erb :'/songs/new'
  end

  post '/songs' do

    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    # Any given song's show page should have links to that song's artist and each genre associated with the song.
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do

    redirect "songs/#{@song.slug}"
  end

end