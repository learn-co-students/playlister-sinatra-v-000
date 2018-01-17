class GenresController < ApplicationController
    
    
    get "/genres/:slug" do
        @item = Genre.find_by_slug(params[:slug])
        puts @item.to_s
        erb :show
    end
    
    get "/genres" do
        @list = Genre.all
        erb :list
    end
    
    
    
end