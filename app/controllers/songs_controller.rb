class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :"/songs/index"
  end


  get '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])

    erb :"/songs/show"
  end

  helpers do
    def slug
      self.name.gsub(" ", "-").downcase
    end

    def find_by_slug(slug)
      self.all.find { |instance| instance.slug == slug}
    end
  end

end
