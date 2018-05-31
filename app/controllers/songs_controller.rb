require 'rack-flash'
require 'pry'

class SongController < ApplicationController
  configure do
    enable :sessions
    use Rack::Flash 
    use Rack::MethodOverride
  end
  
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
  
  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    
    erb :'songs/edit'
  end
  
  post '/songs' do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    if !params[:genre][:name].empty?
      genre = Genre.create(params[:genre])
      @song.genres << genre 
    end 
    @song.save 
    
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end 
  # params: {"song"=>{"name"=>"Weak", "artist_id"=>"5", "genre_ids"=>["1", "3"]}, "artist"=>{"name"=>""}, "genre"=>{"name"=>""}, "captures"=>[]}
  
  patch '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genres = params[:song][:genre_ids].collect{|id| Genre.find(id)}
    if !params[:genre][:name].empty?
      genre = Genre.create(params[:genre])
      @song.genres << genre 
    end
    @song.save
    
    flash[:message] = "Successfully updated song."
    erb :'songs/show'
  end
  
end 