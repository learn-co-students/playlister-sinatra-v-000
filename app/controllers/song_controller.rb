class SongController < ApplicationController

#idnex
get '/songs' do
    @songs = Song.all


erb :'/songs/index'
end

#new form
get '/songs/new' do

erb :'/songs/new'
end

#show
get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])


erb :'/songs/show'
end


#create
post '/songs' do
      
     @song = Song.create(:name => params[:song][:name])
     

     @genres = []
     params[:song][:genres].each {|genre| 
                                   @genre = Genre.find_or_create(:id => genre)
                                   @genres << @genre
     }
     @song.genres = @genres

     
     @song.artist = Artist.find_or_create(params[:song][:artist])
     @song.save



redirect "/songs/#{@song.slug}"
end


#update
post '/songs/:slug' do
    
end



end

