# require 'rack-flash'

class SongsController < ApplicationController


  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

#--CREATE

  get '/songs/new' do
    erb :new
  end
#--SLUG
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  # post '/songs' do
  #   @song = Song.create(name: params["Name"])
  #   redirect to '/songs/#{song.id}'
  # end

  #--READ

  get '/songs/:id' do
    @song = Song.find_by_id(params[:id])
    erb :show
  end


  #--UPDATE

  get '/songs/:id/edit' do  #load edit form
    @song = Song.find_by_id(params[:id])
    erb :edit
  end

  patch '/songs/:id' do #edit action
    @song = Post.find_by_id(params[:id])
    @song.title = params[:name]
    @song.save
    redirect to "/songs/#{@song.id}"
  end

  #--DELETE
  delete '/songs/:id/delete' do #delete action
    @song = Post.find_by_id(params[:id])
    @song.delete
    redirect to '/songs'
  end
end
