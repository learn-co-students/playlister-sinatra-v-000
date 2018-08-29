class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/' do
    erb :index
  end

  patch '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    artist = Artist.find_by_slug(params['Artist Name'])
    if  !artist.nil?
      artist_obj = Artist.create(name: params['Artist Name'])
      @song.artists << artist_obj
    else
      @song.artist = artist
    end
    if !params['Genre Name'].empty?
        genre = Genre.create(name: params['Genre Name'])
        @song.genres << genre
      end
    
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end  
end