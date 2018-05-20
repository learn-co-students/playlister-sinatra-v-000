class SongController < ApplicationController
    get '/songs' do
      @songs = Song.all
      erb :'/songs/index'
    end

    get '/songs/new' do
      @genres = Genre.all
      erb :'/songs/new'
    end

    post '/songs' do

      @song = Song.create(name: params[:song_name])


      if !Artist.find_by(name: params[:artist_name])

        @artist = Artist.create(name: params[:artist_name])
      else

        @artist = Artist.find_by(name: params[:artist_name])
      end
      @song.artist_id = @artist.id

      if !params["genres"].empty?

        SongGenre.all.each do |song_genre|

          if song_genre.song_id == @song.id
            song_genre.delete
          end
        end
        params["genres"].each do |new_genre|

          SongGenre.create(genre_id: new_genre[0], song_id: @song.id)
        end
      end


      @song.save
      flash[:message] = "Successfully created song."
      redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @song_genres = SongGenre.all
      erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      @genres = Genre.all

      erb :'/songs/edit'
    end

    post '/songs/:slug' do

      @song = Song.find_by(name: params[:song_name])
      @artist = Artist.find_by(name: params[:artist_name])
      @song.update(name: params[:song_name], artist_id: @artist.id)
      if !params["genres"].empty?
        SongGenre.all.each do |song_genre|
          if song_genre.song_id == @song.id
            song_genre.delete
          end
        end
        params["genres"].each do |new_genre|
          SongGenre.create(genre_id: new_genre[0], song_id: @song.id)
        end
      end

    flash[:message] = "Successfully updated song."
      redirect to "/songs/#{@song.slug}"
    end



  end
