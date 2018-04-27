class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  require 'sinatra/flash'
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/' do
    erb :index
  end
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end
  get '/songs/new' do
    #
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug] )

    erb :'/songs/show'
  end

  get '/artists' do
    @artists = Artist.all
    # binding.pry
    erb :'/artists/index'
  end


  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug] )
    # @artist.slug = params[:slug]
    erb :'/artists/show'
  end

    get '/genres' do
      @genres = Genre.all
      # binding.pry
      erb :'/genres/index'
    end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug] )
    erb :'/genres/show'
  end

   post '/songs' do
    #  raise params.inspect
      @artist = Artist.find_or_create_by(:name => params["artist_name"])
      @song = Song.create(:name => params["song_name"], :artist_id => @artist.id)

      @song.genre_ids = params[:genres]

      @song.save
      #
      # flash[:success_message] = "Song successfully updated."
      #   @success_message = session[:success_message]

        # binding.pry

       redirect "/songs/#{@song.slug}"
       end

       get "/songs/:slug/edit" do
         @song = Song.find_by_slug(params[:slug])

         erb :'/songs/edit'
       end

       patch '/songs/:slug' do
         @song = Song.find_by_slug(params[:slug])
        @artist = Artist.find_or_create_by(:name => params["artist_name"])
        @song.update(:name => params["song_name"], :artist_id => @artist.id)

         @genres = Genre.find(params[:genres])

         @song.song_genres.clear

        @genres.each do |genre|
          song_genre = SongGenre.new(:song_id => @song.id, :genre => genre)
        end
         @song.save
         flash[:success] = "Successfully updated song."
         redirect "/songs/#{@song.slug}"
        #
       end

       delete '/songs/:slug'  do
         @song = Song.find_by_slug(params[:slug])
         @song.destroy
         redirect '/songs'

       end

end
#
