

class SongsController < ApplicationController
    
    get '/songs' do #index
        @songs = Song.all
        erb :"/songs/index"
    end

    get '/songs/new' do #create
        @artists = Artist.all
        @genres = Genre.all
        erb :"/songs/new"
    end
    
    post '/songs' do #create
        @song = Song.create(:name => params[:song][:name])

      artist_entry = params[:song][:artist]
    if Artist.find_by(:name => artist_entry)
      artist = Artist.find_by(:name => artist_entry)
    else
      artist = Artist.create(:name => artist_entry)
    end
    @song.artist = artist

    genre_selections = params[:song][:genres]
    genre_selections.each do |genre|
      @song.genres << Genre.find(genre)
    end

    @song.save

    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
    end

    get '/songs/:slug' do #show
        @song = Song.find_by_slug(params[:slug])
        erb :"/songs/show"
    end


    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        song.name = params[:song][:name]
    
        artist_name = params[:song][:artist]
        if Artist.find_by(:name => artist_name)
          if song.artist.name != artist_name
            song.artist = Artist.find_by(:name => artist_name)
          end
        else
          song.artist = Artist.create(:name => artist_name)
        end
    
        if song.genres
          song.genres.clear
        end
        genres = params[:song][:genres]
        genres.each do |genre|
          song.genres << Genre.find(genre)
        end
    
        song.save
        flash[:message] = "Successfully updated song."
        redirect to "songs/#{song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :"/songs/edit"
    end

    


end
