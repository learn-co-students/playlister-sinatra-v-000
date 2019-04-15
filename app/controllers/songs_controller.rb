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
    redirect("/songs/#{@song.slug}")
    erb :'songs/show'
  end


  get 'song/:slug' do
    erb :'songs/show'
  end


  get 'songs/:slug/edit' do
    erb :'songs/edit'
  end


  patch 'songs/:slug'do
    redirect ("songs/#{@song.slug}")
    erb :'songs/update'

  end
