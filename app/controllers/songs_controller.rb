require 'rack-flash'

class SongsController < ApplicationController
use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do #Order matters. This before /:slug.
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.all.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:name]) #...format was wrong.

    @song.artist = Artist.find_or_create_by(name: params[:artist]) #they meant if the artist wasn't already in the db. ugh.
    @song.genres << Genre.find(params[:genres].join.to_i) #this lab is just the worst. five hours for this one test.
    @song.save

    flash[:message] = "Successfully created song."
     redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug]) # forgot :x
    erb :'songs/edit'
  end

  patch '/songs/:slug' do #didn't expect this to make all tests pass at once since it's just adapted from the CRUD lab. Weird.
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:name]
    @song.artist = params[:artist]
    @song.save
    redirect '/songs/:slug'
  end

end
