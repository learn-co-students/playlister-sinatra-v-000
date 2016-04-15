class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    set :session_secret, "my_application_secret"
  end


    patch '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @song.update(params[:song])
      @song.artist = Artist.create(params[:artist]) if !params[:artist][:name].empty?
      @song.genres << Genre.create(params[:genre]) if !params[:genre][:name].empty?
      @song.save
      redirect "/songs/#{@song.slug}", locals: {message: "Song successfully updated."}
    end
end
