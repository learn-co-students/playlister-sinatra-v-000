class ArtistsController < ApplicationController
    
    
    get "/artists/:slug" do
        @item = Artist.find_by_slug(params[:slug])
        puts @item.to_s
        #"Hello world!"
        erb :show
    end
    
    get "/artists" do
        @list = Artist.all
        erb :list
    end
    
    
    
end