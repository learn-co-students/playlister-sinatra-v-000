class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do

    erb :'/songs/new'
  end

  post '/songs' do
    # @song = Song.create()
    # redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song_genres = SongGenre.all
    erb :'/songs/show'
  end

end

# rspec spec/features/04_basic_view_spec.rb
# rspec spec/features/05_song_form_spec.rb

# learn --f-f << -- only reports the first spec failure
