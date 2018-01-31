require 'pry'
require 'rack-flash'
class SongsController < ApplicationController
use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(name: params["Name"])
   params["genres"].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    if Artist.all.any? {|a| a.name == params["Artist Name"]}
      @song.artist = Artist.find_by(name: params["Artist Name"])
    else
      @song.artist = Artist.create(name: params["Artist Name"])
    end
    @song.save

    #binding.pry
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    #@song.update =
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["Name"]) if !params["Name"].empty?
    params["genres"].each do |genre_id|
       @song.genres << Genre.find(genre_id)
     end
      @song.genres.uniq!
    if Artist.all.any? {|a| a.name == params["Artist Name"]}
      @song.artist = Artist.find_by(name: params["Artist Name"])
    elsif !params["Artist Name"].empty?
      @song.artist = Artist.create(name: params["Artist Name"])
    end
    @song.save
    #binding.pry
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
