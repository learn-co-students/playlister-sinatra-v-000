class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all.sort {|a,b| a.name <=> b.name}
    erb :"songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all.sort {|a,b| a.name <=> b.name}
    erb :"songs/new"
  end

  get '/songs/:slug' do
    if flash[:notice]
      @flash = flash[:notice].dup
      flash[:notice].clear
    end
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post '/songs' do
    song = Song.find_or_create_by(name: params[:song][:name])
    if params[:song][:artist]
      artist = Artist.find_or_create_by(name: params[:song][:artist])
      artist.songs << song
    end
    params[:song][:genre].each do |genre|
      if !song.genres.include? genre
        song.genres << Genre.find_or_create_by(id: genre)
      end
    end
    song.slugify
    song.save
    flash[:notice] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all.sort {|a,b| a.name <=> b.name}
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:song][:name])
    @song.artist.update(name: params[:song][:artist])
    if !@song.genres.include?(params[:song][:genre])
      @song.genres.clear
      params[:song][:genre].each do |genre|
        g = Genre.find_or_create_by(id: genre)
        @song.genres << g
      end
    end
    @song.slugify
    flash[:notice] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end


end
