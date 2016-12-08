class SongsController < ApplicationController
enable :sessions
use Rack::Flash

  get '/songs' do
    @songs = Song.all.sort_by {|song| song.name}
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(params[:artist])
    @song.genre_ids = params[:song][:genre_ids]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:song][:name])
    @song.artist =Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:song][:genre_ids]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
