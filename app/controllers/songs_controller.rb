class SongsController < ApplicationController
  enable :sessions
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @success_message = session[:success_message]
    session[:success_message] = nil
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do

    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = Genre.all
    #binding.pry
    erb :'/songs/edit'
  end

  patch '/songs' do

    song = Song.find_by(params[:song])
    artist = Artist.find_by(params[:artist])
    if params[:artist][:name] != ""
      if Artist.find{|a| a.name == params[:artist][:name]}
        artist = Artist.find{|a| a.name == params[:artist][:name]}
      else
        artist = Artist.create(params[:artist])
      end
      song.artist = artist

    end
    song.save
    session[:success_message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"
  end

  post '/songs' do
    @song = Song.new(params[:song])

    if params[:artist][:name] != ""
      if Artist.find{|a| a.name == params[:artist][:name]}
        artist = Artist.find{|a| a.name == params[:artist][:name]}
      else
        artist = Artist.create(params[:artist])
      end
      @song.artist = artist
    end

    if !params[:genres].empty?
      params[:genres].each{|genre| @song.genres << Genre.find(genre)}
    end

    if params[:genre][:name] != ""
      if Genre.find{|g| g == params[:genre][:name]}
        genre = Genre.find{|g| g == params[:genre][:name]}
      else
        genre = Genre.create(params[:genre])
      end
      @song.genres << genre
    end

    @song.save
    session[:success_message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end
end
