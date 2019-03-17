class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.new(name: params[:Name])
    binding.pry
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])

    @song.genres << Genre.find_by_id(params[:genres])
    @song.save
    # binding.pry
    redirect to 'songs/<%=@song.slug%>'
  end
  #
  # post 'songs/new' do
  #
  # end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end


  #
  # get 'songs/:slug/edit' do
  # end
end
