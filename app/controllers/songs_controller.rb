class SongsController < ApplicationController

  get '/songs' do
    erb :'songs/index'
  end

    get '/songs/new' do
      erb :'songs/new'
    end

    get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      erb :'songs/edit'
    end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    # params.to_s

    @song = Song.new(:name => params[:name], :genres => params[:song][:genres])
    @song.artist = Artist.find_or_create_by(params[:artist_name])
    @song.save

    redirect "/songs/#{@song.slug}"
  end

  patch "/songs/<%=@song.slug%>" do
    
  end

end
