class SongsController < ApplicationController


  get '/songs' do
     erb :'views/songs/index'
   end


end
