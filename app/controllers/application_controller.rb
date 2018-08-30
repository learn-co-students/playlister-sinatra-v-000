class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/' do
    erb :index
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    new_genres = []
    artist = Artist.find_by(name: params['Artist Name'])
    if !params['Genre Name'].empty?
        new_genre = Genre.create(name: params['Genre Name'])
        new_genres << new_genre
    end
    if !params[:genre_ids].nil?
      params[:genre_ids].each do |id|
        genre = Genre.find(id)
        new_genres << genre
      end
    end
      
    @song.update(name: params['Name'], artist_id: artist.id, genres: new_genres)
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end  
end