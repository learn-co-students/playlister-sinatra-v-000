class SongController < ApplicationController

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @song.genres
    if !params[:artist][:name].empty? && !Artist.find_by(name: params[:artist][:name])
      @song.artist = Artist.create(params[:artist])
    elsif !params[:artist][:name].empty?
      @song.artist = Artist.find_by(name: params[:artist][:name])
    end

    if !params[:genres].empty?
      params[:genres].each_with_index do |genre, idx|
        @song.genres << Genre.find(params[:genres][idx])
      end
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.create(params[:genre])
    end
    @song.save

    flash[:message] = "Successfully created song."

    redirect :"/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[slug])
    @song.genres
    if !params[:artist][:name].empty? && !Artist.find_by(name: params[:artist][:name])
      @song.artist = Artist.create(params[:artist])
    elsif !params[:artist][:name].empty?
      @song.artist = Artist.find_by(name: params[:artist][:name])
    end

    if !params[:genres].empty?
      params[:genres].each_with_index do |genre, idx|
        @song.genres << Genre.find(params[:genres][idx])
      end
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.create(params[:genre])
    end
    @song.save

    flash[:message] = "Successfully created song."

    redirect :"/songs/#{@song.slug}"
  end

end
