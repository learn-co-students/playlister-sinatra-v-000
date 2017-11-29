class SongsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/songs/") }

  get '/songs' do
    @Songs = Song.all
    erb :index
  end
end
