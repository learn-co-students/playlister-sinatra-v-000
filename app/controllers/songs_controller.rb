class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @category = Song
    erb :show_category
  end

  get '/songs/new' do
    @available_genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    Song.new(name: params[:song_name]).tap do |song|

      unless params[:artist_name] == ""
        if Artist.find_by(name: params[:artist_name])
          song.artist = Artist.find_by(name: params[:artist_name])
        else
          song.build_artist(name: params[:artist_name])
        end
      end

      if params[:genre_ids]
        params[:genre_ids].each{|id| song.genres << Genre.find(id)}
      end

      song.save

      flash[:message] = "Successfully created song."
      redirect "/songs/#{song.slug}"
    end
  end

  get '/songs/:slug' do
    if Song.find_by_slug(params[:slug])
      @item = Song.find_by_slug(params[:slug])
      erb :show_item
    end

  end

  get '/songs/:slug/edit' do
    if Song.find_by_slug(params[:slug])
      @song = Song.find_by_slug(params[:slug])
      @available_genres = Genre.all
      erb :'songs/edit'
    end

  end

  patch '/songs/:slug' do
    Song.find_by_slug(params[:slug]).tap do |song|

      unless params[:song_name] == ""
        song.name = params[:song_name]
      end

      unless params[:artist_name] == ""
        if Artist.find_by(name: params[:artist_name])
          song.artist = Artist.find_by(name: params[:artist_name])
        else
          song.build_artist(name: params[:artist_name])
        end
      end

      if params[:genre_ids]
        song.genres.replace(params[:genre_ids].collect{|id| Genre.find(id)})
      else
        song.genres.clear
      end

      song.save

      flash[:message] = "Successfully updated song."
      redirect "/songs/#{song.slug}"
    end
  end

end