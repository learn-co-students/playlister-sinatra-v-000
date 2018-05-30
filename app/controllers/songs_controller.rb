class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all.sort_by{|song| song.name}
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all.sort_by{|g| g.name}
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song]) unless @song
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.artist = artist

    if params["genres"]
      genre = Genre.find(params[:genres])
      @song.genres << genre
    elsif !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end

    @song.save

    flash[:notice] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
  end



end
