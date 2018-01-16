class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @success_message = session[:message]
    session[:message] = nil

    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create_from_form(params["song_name"], params["artist_name"], params["genres"])
    flash[:message] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.update_from_form(params["slug"], params["song_name"], params["artist_name"], params["genres"])
    flash[:message] = "Successfully updated song."

    redirect to "/songs/#{@song.slug}"
  end

end
