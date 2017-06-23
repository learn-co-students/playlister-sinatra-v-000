class SongController < ApplicationController

#idnex
get '/songs' do
    @songs = Song.all


erb :'/songs/index'
end
# #create

get '/songs/new' do

    erb :'/songs/new'
end


post '/songs' do
      @song = Song.create(:name => params[:song][:name])
      
 
      @genres = []
      params["song"]["genres"].each {|genre| 
                                    @genre = Genre.find_or_create_by(:name => genre[:name])
                                    @genres << @genre
      }
      @song.genres = @genres
 
      
      @song.artist = Artist.find_or_create_by(:name => params["song"]["artist"])
      @song.save

redirect "/songs/#{@song.slug}"
end



#new form

#show
get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])


erb :'/songs/show'
end


get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
end




#update
post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params["song"]["name"]
    @song.artist = Artist.find_or_create_by(:name => params["song"]["artist"])

     @genres = []
     params["song"]["genres"].each {|genre| 
                                   @genre = Genre.find_or_create_by(:name => genre[:name])
                                   @genres << @genre
     }
     @song.genres = @genres
     @song.save

     redirect "/songs/#{@song.slug}"
end



end

