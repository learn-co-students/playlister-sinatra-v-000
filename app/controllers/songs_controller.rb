class SongsController < ApplicationController
  get "/songs" do
    erb :"songs/index"
  end

  get "/songs/new" do

  end

  get "/songs/:slug" do
    erb :"songs/show"
  end
end
