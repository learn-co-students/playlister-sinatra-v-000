class SongsController < ApplicationController

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug("#{slug}")
    erb :'songs/show'
  end

  post '/songs' do
    puts "*************"
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_id = params[:genres]
    @song.save
    # flash[:message] = "Successfully created song."
    puts "*****#{@song.slug}*****"
    redirect("/hello/#{@song.slug}")
  end

end
