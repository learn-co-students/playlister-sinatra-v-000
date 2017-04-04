class SongsController < ApplicationController

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    song = Song.new
    song.name = params["Name"]
    if params["Artist Name"] != ""
      if Artist.exists?(:name => params["Artist Name"])
        song.artist = Artist.find_by(name: params["Artist Name"])
      else
        song.build_artist(name: params["Artist Name"])
      end
    else
      song.artist = Artist.find(params["Artist"])
    end
    params.each do |key, value|
      Genre.all.each do |genre|
        if genre.name == key
          song.genres << Genre.find(value)
        end
      end
    end
    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

end
