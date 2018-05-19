class GenreController < ApplicationController


  get '/songs' do
  @songs = Song.all
  erb :'/songs/index'
end

end
