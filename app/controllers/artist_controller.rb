class ArtistController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'



end