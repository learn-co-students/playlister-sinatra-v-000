class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by_name(name: params[:artist][:name])
    end
    @song.save
    redirect "songs/#{@song.slug}"
  end

#  get "/songs/:slug/edit" do
#
#
#    erb :'/songs/edit'
#  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

#  post '/songs/:slug' do
#    @song = Song.find_by_slug(params[:])
#
#    redirect "songs/#{@song.slug}"
#  end

end
