class SongsController < ApplicationController
  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs/new' do
    s = Song.new(name: params[:name])
    params[:genres].each {|genre_id| s.genres << Genre.find(genre_id)}
    if Artist.find_by(name: params[:artist])
      s.artist = Artist.find_by(name: params[:artist]) 
    else
      s.artist = Artist.new(name: params[:artist])
    end
    s.save
    redirect to "/songs/#{s.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug/edit' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:name]) if params[:name] != ""

    if params[:artist] != ""
      if Artist.find_by(name: params[:artist])
        @song.artist = Artist.find_by(name: params[:artist])
      else
        @song.artist = Artist.create(name: params[:artist])
      end
    end

    @song.genres.clear
    params[:genres].each {|genre_id| @song.genres << Genre.find(genre_id)}
   # binding.pry
    @song.save
    redirect to "/songs/#{params[:slug]}"
  end
  
end