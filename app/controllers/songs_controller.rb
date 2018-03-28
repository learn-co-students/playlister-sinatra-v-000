class SongsController < ApplicationController
  
  get "/songs" do
    erb :"songs/index"
  end
  
  get "/songs/new" do
    erb :"songs/new"
  end
  
  get "/songs/:slug" do
    erb :"songs/show"
  end
  
  get "/songs/:slug/edit" do
    erb :"songs/edit"
  end
  
end
