class ArtistsController < ActiveRecord::Base

  get '/artists' do
    erb :'/artists/index'
  end

end
