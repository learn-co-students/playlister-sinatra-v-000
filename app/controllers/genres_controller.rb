class GenresController < ApplicationController
    
    get '/genres' do
      @genres = Genre.all
      erb :'genres/index'
    end
    
    
    get '/genres/new' do
    erb :'genres/new' #show new genres view
    end
    
    
    post '/genres' do
    @genre = Genre.create(params[:genre]) 
    redirect "/genres/#{@genre.id}"
    end
    
            
    get '/genres/:id' do
      @genre = Genre.find(params[:id]) #define instance variable for view
      erb :'genres/show' #show single genre view
    end

    
    get '/genres/:slug' do
    
    end
end 
