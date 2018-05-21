class ArtistsController < ApplicationController

    get '/artists' do
       @artists = Artist.all
       # model name followed by a method
       erb :'/artists/index'
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
