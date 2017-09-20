class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song=Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    #for creating new songs
    @song = Song.create(:name => params[:song]['name'])
    params[:song]['genre_names'].reject{|a| a.empty?}.each{|a| @song.genres.find_or_create_by(:name => a)}
    @song.artist = Artist.find_or_create_by(:name => params[:song]['artist_name'])
    @song.save
    redirect "/songs/#{@song.slug}?status=new"
  end

  post '/songs/:slug/edit' do
    #for updating a song
    @song = Song.find_by_slug(params[:slug])
    my_params = {}
    if !params[:song]['name'].empty?
      my_params[:name] = params[:song]['name']
    end

    if params[:song]['genre_names'].any?{|a| !a.empty?}
      genres = params[:song]['genre_names'].reject{|a| a.empty?}.map{|a| Genre.find_or_create_by(:name => a)}
      my_params[:genres] = genres
    end

    if !params[:song]['artist_name'].empty?
      artist = Artist.find_or_create_by(:name => params[:song]['artist_name'])
      my_params[:artist] = artist
    end
    @song.update(my_params)


    redirect "/songs/#{@song.slug}?status=updated"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end
end
