class SongsController < ApplicationController
    
    
    get "/songs/new" do
        @genres = Genre.all
        erb :new
    end
    
    get "/songs/:slug" do
        #puts params[:slug]
        @item = Song.find_by_slug(params[:slug])
        erb :show
    end
    
    get "/songs/:slug/edit" do
        puts params[:slug]
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :edit
    end
    
    post "/songs/:slug" do 
        @song = Song.find_by(name: params["Name"])
        @artist = Artist.find_or_create_by(name: params["Artist Name"])
        @song.artist = @artist
        @song.genres << Genre.find(params["Genre"])
        @song.update
        redirect to "songs/#{@song.slug}"
        #redirect to "songs/that-one-with-the-guitar"
    end
    
    get "/songs" do
        @list = Song.all
        erb :list
    end
    
    
      post '/songs' do 
        @song = Song.new(name: params["Name"])
        @artist = Artist.find_or_create_by(name: params["Artist Name"])
        @song.artist = @artist
        @song.genres << Genre.find(params["Genre"])
        # if !(params["owner_name"].empty?)
        #   @pet.owner = Owner.create(name: params["owner_name"])
        # end
        @song.save
        redirect to "songs/#{@song.slug}"
        #@song.to_s #+ params[:song][:artist]
      end
  
    
    
    
    
end