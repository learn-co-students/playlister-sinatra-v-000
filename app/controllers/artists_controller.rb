class ArtistsController < ApplicationController

    get '/artists' do
       @artists = Artist.all
       # model name followed by a method
       erb :'/artists/index'
     end

     get '/artists/:slug' do
         @artist = Artist.find_by_slug(params[:slug])  # slug helps to find by name instaed of ID
         erb :'/artists/show'
     end


 #
 #  get '/genres'
 #   end
 #
 #   get '/artists'
 #  end
 #
 #
 #  get '/songs/new'
 #  end
 #
 #
 #  get '/songs/:slug'
 # end
 #
 # get '/artists/:slug'
 #  end
 #
 #  get'/genres/:slug'
 #
 #   end
end
