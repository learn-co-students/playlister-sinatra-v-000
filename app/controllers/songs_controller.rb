require 'rack-flash'
class SongsController < ApplicationController

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs=Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song=Song.find_by_slug(params[:slug])
    binding.pry
    erb :'songs/show'

  post '/songs' do
    @song=Song.create({name: params[:name]})
    @song.artist=Artist.find_or_create_by(name: params[:artist_name])
    if @song.genres != []
      @song.genres << params[:genres].collect {|genre| Genre.find(genre)}
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song=Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs' do
    @song=Song.create({name: params[:name]})
    @song.artist=Artist.find_or_create_by(name: params[:artist_name])
    @song.genres << params[:genres].collect {|g| Genre.find(g)}
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song=Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song=Song.find_or_create_by({name: params[:name]})
    @song.artist=Artist.find_or_create_by(name: params[:artist_name])
    @song.genres << params[:genres].collect {|genre| Genre.find(genre)}
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end

end
