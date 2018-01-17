
class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @slug = params[:slug]
    @genre = Genre.find_by_slug(@slug)
    @songs = Array.new
    Song.all.each do |song|
      if song.genres.include?(@genre) 
        @songs << song 
      end
    end
  
    @artists = Array.new
    @songs.each do |song|
      Artist.all.each do |artist| 
        if song.artist_id == artist.id
          @artists << artist 
        end
      end
    end
   

    erb :'/genres/show' 
  end
  
  post '/genres/:slug' do
    @slug = params[:slug]
    @genre = Genre.find_by_slug(@slug)
    erb :'/genres/show' 
  end

  
end