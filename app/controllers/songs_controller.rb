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
    @song = Song.create(:name => params[:name])
    binding.pry
    @song.artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.genres = params[:genres][]
    @song.save
    redirect "/songs/#{@song.slug}"
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])
    redirect "/songs/#{@song.slug}"
  end

end
