class SongsController < ApplicationController
    require 'rack-flash'
    use Rack::Flash
  
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end

    post '/songs' do
        @song = Song.create(:name => params["song"]["name"])
        if !@song.artist = Artist.find_by(:name => params["song"]["artist"])
            @song.artist = Artist.create(:name => params["song"]["artist"])
        end
        params["song"]["genre_ids"].each do |genre_id|
            @song.genres << Genre.find(genre_id)
        end
        @song.save
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.name = params["song"]["name"]
        if !@song.artist = Artist.find_by(:name => params["song"]["artist"])
            @song.artist = Artist.create(:name => params["song"]["artist"])
        end
        params["song"]["genre_ids"].each do |genre_id|
            if !@song.genres.include?(Genre.find(genre_id))
                @song.genres << Genre.find(genre_id)
            end
        end
        @song.save
        flash[:message] = "Successfully updated song."
        redirect to "/songs/#{@song.slug}"
    end
end