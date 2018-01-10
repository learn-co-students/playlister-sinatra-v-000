class SongsController <ApplicationController

    get '/songs' do

      @songs = Song.all

#binding.pry
      erb :'/songs/index'

    end
end


#setup use SongsController in our confi.ru file
#rspec spec/models/03_genre_spec.rb
