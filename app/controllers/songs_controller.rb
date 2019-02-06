require 'pry'

class SongsController < ApplicationController

  get '/songs' do

    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do

    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do

    @song = Song.create(:name => params[:Name])

    if !params[:genres].empty?
      params[:genres].each do |id|
        @song.genres << Genre.find_by_id(id)
      end
    end

    if !params["Artist Name"].empty? && !Artist.all.find {|artist| artist.name == params["Artist Name"]}
      @song.artist = Artist.create(:name => params["Artist Name"])
      @song.save
    elsif !params["Artist Name"].empty?
      @song.artist = Artist.find {|artist| artist.name == params["Artist Name"]}
      @song.save
    end


    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"

  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    @song.name = params[:Name]

    if !params["Artist Name"].empty? && !Artist.all.find {|artist| artist.name == params["Artist Name"]}
      @song.artist = Artist.create(:name => params["Artist Name"])
      @song.save
    elsif !params["Artist Name"].empty?
      @song.artist = Artist.find {|artist| artist.name == params["Artist Name"]}
      @song.save
    end

    params[:genres].each do |id|
      @song.genres << Genre.find_by_id(id)
    end

    @song.save
    
    redirect "/songs/#{@song.slug}"
  end
end
