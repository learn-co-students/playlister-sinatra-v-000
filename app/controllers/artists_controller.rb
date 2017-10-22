class ArtistsController < ApplicationController

  get '/artists' do
    @artists =Artist.all
    erb :'/artists/show'
  end

end
