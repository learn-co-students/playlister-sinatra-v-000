class SongsController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
   erb :'/songs/new'
  end

  get '/songs/:slug' do
    #using collect to select multiple songs with the same name
    @songs = Song.all.select{|obj| obj.slug == params[:slug]}
    erb :'/songs/show'
  end

  post '/songs' do
   params[:genres].each{|id| params[:genre_name] = Genre.find(id.to_i).name}

   LibraryParser.new.build_objects(params[:artist_name], params[:song_name], params[:genre_name])

   song_slug = Song.find_by(name:params[:song_name]).slug
   flash[:message]="Successfully created song."
      redirect to("/songs/#{song_slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.all.select{|t| t.slug == params[:slug]}.first
    erb :"/songs/edit"
  end

  patch '/songs/:slug/edit' do
    @song = Song.all.select{|t| t.slug == params[:slug]}.first
     @song.artist.update(name: params["Artist Name"])
      flash[:message]="Successfully updated song."
     redirect to("/songs/#{params[:slug]}")
  end


end
