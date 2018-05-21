require 'pry'
class GenresController < ApplicationController

     get '/genres' do
       @genres = Genre.all
       # model name followed by a method
       erb :'/genres/index'
     end

end
