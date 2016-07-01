class ArtistsController < ApplicationController

  get '/artists' do 
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @slug = params[:slug]
    @artist = Artist.find_by_slug(@slug)
      
    @song_array = [] 
    Song.all.each do |song|
      if song.artist_id == @artist.id
        @song_array << song 
      end
    end


  
  @song_genres = []
    Song.all.each do |song|
      SongGenre.all.each do |sg|
         if song.artist_id == @artist.id && sg.song_id == song.id
        @genre = Genre.find(sg.genre_id)
        @song_genres << @genre
      end
    end
  end
    erb :'/artists/show' 
  end

  post '/artists/:slug' do
    @slug = params[:slug]
    @artist = Artist.find_by_slug(@slug)
    erb :'/artists/show'
  end

end

=begin
  
class ArtistsController < ApplicationController

  
  get '/artists' do
    @artists = Artist.all
    erb:'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end
end
  
=end
