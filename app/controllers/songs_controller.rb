# require 'sinatra/base'
# require 'rack-flash'

class SongsController < ApplicationController

 enable :sessions
  # use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params[:artist_name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    end
    @song.save

    # Taking this route b/c flash is not working
    session[:created_song] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :song_show

    # erb :'songs/show' -- This just will not work for some reason and keeps throwing 500 errors on this route.
  end


  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params[:artist_name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    end
    @song.save

    # Taking this route b/c flash is not working
    session[:updated_song] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end

#TO FIX:
  # patch '/posts/:id' do #edit action
  #   @post = Post.find_by_id(params[:id])
  #   @post.title = params[:title]
  #   @post.content = params[:content]
  #   @post.save
  #   redirect to "/posts/#{@post.id}"
  # end

end
