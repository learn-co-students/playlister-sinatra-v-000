class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index', :locals => { :message => "Successfully created song."}
  end

  post '/songs' do
    @song = Song.new(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
    @song.save
    redirect '/songs'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show', :locals => { :message => "Song successfully updated." }
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name]) unless params[:artist_name] == ""
    @song.genre_ids ||= params[:genres]
    @song.save
    redirect "songs/#{@song.slug}"
  end

end
