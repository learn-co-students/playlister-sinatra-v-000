
class ArtistsController < ApplicationController


  get '/artists/new' do
    @artists = Artist.all
    erb :'artists/index'
  end

  # post '/artists' do
  #   #binding.pry
  #   artist = Artist.new(params[:id])
  #   artist.name = params[:name]
  #   artist.save
  #   flash[:message] = "Successfully created artist."
  #   redirect "/artists/#{artist.id}"
  # end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end
end
