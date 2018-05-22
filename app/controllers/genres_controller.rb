require 'pry'
class GenresController < ApplicationController

     get '/genres' do
       @genres = Genre.all
       # model name followed by a method
       erb :'/genres/index'
     end

     get '/genres/:slug' do
         @genre = Genre.find_by_slug(params[:slug])  # slug helps to find by name instaed of ID
         erb :'/genres/show'
     end


end
