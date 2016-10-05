class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
  @song = Song.create(name: params["Name"])

    if Artist.find_by(name: params["Artist Name"])
      @song.artist = Artist.find_by(name: params["Artist Name"])
    else
      @song.artist = Artist.create(name: params["Artist Name"])
    end

    params["genres"].each do |genre|
      @song.genres << Genre.find(genre.to_i)
    end
  @song.save
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    binding.pry
    @song.update(@song.id, @song.name => params["Name"], @song.artist => Artist.find_by(name: params["Artist Name"]))
    @song.save
    redirect to "songs/#{@song.slug}"
  end
end
