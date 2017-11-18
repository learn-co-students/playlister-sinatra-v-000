class Songscontroller < ApplicationController


  get '/songs/index' do
    erb :'songs/index'
  end

  get '/songs/show' do
    erb :'songs/show'
  end

  get '/songs/edit' do
    erb :'/songs/edit'
  end

  get '/songs/new' do

    erb :'/songs/new'
  end

  patch '/songs/edit/:id' do

    erb ;'/songs/show/:id'
  end

  get '/songs/show/:edit' do

    erb :'/songs/show'
  end

end
