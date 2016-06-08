require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    if params["Artist Name"].empty?
      @artist = Artist.find_by(:id => params['existing_artist'])
      @new_song = Song.create(:name => params[:Name], :artist_id => @artist.id, :genre_ids => params[:genre])
    else
      @new_artist = Artist.find_or_create_by(:name => params["Artist Name"])
      @new_song = Song.create(:name => params[:Name], :artist_id => @new_artist.id, :genre_ids => params[:genre])
    end
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@new_song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find{|song| song.slug == params["slug"]}
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if params["Artist Name"].empty?
      @song.name = params[:Name]
      @song.artist_id = params["existing_artist"]
      @song.genre_ids = params[:genre]
      @song.save
    else
      @artist = Artist.create(:name => params["Artist Name"])
      @song.name = params[:Name]
      @song.artist_id = @artist.id
      @song.genre_ids = params[:genre]
      @song.save
    end
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

    # if params["Artist Name"] == nil
    #   @artist_id = Artist.find_by(:name => params['Artist Name']).id
    #   @new_song = Song.create(:name => "params[:name]", :artist_id => @artist_id)
    #   @new_song.save
    # else
    #   if !@exisiting_artist = Artist.find_by(:name => params["Artist Name"])
    #     @new_song = Song.create(:name => params[:name])
    #     @new_artist = Artist.create(:name => params["Artist Name"])
  
    #     @new_artist.songs << @new_song
    #     @new_song.save
    #   else
    #     @artist = Artist.find_by(:name => params['Artist Name'])
    #     #@artist_id = Artist.find_by(:name => params['Artist Name']).id
    #     @new_song = Song.create(:name => params[:name])
    #     @new_song.artist = @artist
    #     @new_song.save
    #    end
    #  end
  #   redirect "/songs/#{@new_song.slug}"
  #end

end