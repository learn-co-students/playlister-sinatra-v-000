class SongController < ApplicationController
    
    get '/songs' do 
        erb :'song/index'
    end
    
    get '/songs/new' do 
        erb :'song/new'
    end

    post '/songs' do
        @song = Song.create(:name => params["Name"], :genre_ids => params[:song][:genre_ids],)
        artists = []
        Artist.all.each do |artist|
            artists << artist.name
        end
        if artists.include?(params["Artist Name"])
            @song.artist = Artist.find_by(:name => params["Artist Name"])
        else
          if !params["Artist Name"].empty?
              @song.artist = Artist.create(:name => params["Artist Name"])
          else
              @song.artist = Artist.find(params[:song][:artist_id])
          end
        end
          @song.save
                  binding.pry

          @song.slug = @song.slug
         redirect('/songs/#{@song.slug}')
    end
    
    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'song/edit'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'song/show'
    end
    
end