require 'pry'
class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do

  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.all.detect { |song| song.slug == slug}
    binding.pry
    erb :'songs/show'
  end
end
