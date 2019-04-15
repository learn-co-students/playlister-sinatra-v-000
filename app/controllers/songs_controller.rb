require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end


  get '/songs/new' do
    erb :'/songs/new'
  end


  post '/songs' do

    flash[:message] = "Successfully created song"
    redirect("/songs/#{@song.slug}")
  
  end


  get 'songs/:slug' do
    erb :'songs/show'
  end


  get 'songs/:slug/edit' do
    erb :'songs/edit'
  end


  patch 'songs/:slug' do
    flash[:message] = "Successfully updated song."
    redirect ("/songs/#{@song.slug}")
    erb :'songs/update'

  end
