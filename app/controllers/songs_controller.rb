class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(params[:artist])
    @song.genre_ids = params[:genres]
    @song.save

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)

    erb :'/songs/show'
  end

  patch '/songs/:slug' do

  end

  get '/songs/:slug/edit' do

  end

end
