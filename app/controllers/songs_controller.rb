require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    # binding.pry
    new_song = Song.create(:name => params[:song][:name])
    new_song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    params[:genres].each do |genre|
      selected_genre = Genre.find_or_create_by(:id => genre.to_i)
      new_song.genres << selected_genre unless new_song.genres.include?(selected_genre)
    end
    new_song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{new_song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
    @song.genres.clear
    params[:genres].each {|genre| @song.genres << Genre.find_or_create_by(:id => genre.to_i)}
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

end
