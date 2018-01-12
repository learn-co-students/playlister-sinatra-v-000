class SongsController <ApplicationController

use Rack::Flash  #enables us to use our flash at the bottom
    get '/songs' do

      @songs = Song.all
#binding.pry
      erb :'/songs/index'

    end
    get '/songs/new' do   #has to go before :slug route. if slug route was 1st then it would interpret new as a slug
#binding.pry
      erb :'/songs/new'
    end
    get '/songs/:slug' do  #sets a dymanic link

      @song = Song.all.find_by_slug(params[:slug])
#    binding.pry
      erb :'/songs/show'
    end
    post '/songs' do
#binding.pry

      @song = Song.create(name: params["Name"])
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
      @song.genre_ids = params[:genres]
      @song.save  #add to db
#binding.pry
      flash[:message] = "Successfully created song."
      #with flash, add code to config.ru and the below redirect link so that the code runs
      redirect "/songs/#{@song.slug}"
    end


end


#setup use SongsController in our confi.ru file
# =>    rspec spec/features/05_song_form_spec.rb
