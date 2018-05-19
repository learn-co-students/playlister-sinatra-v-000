class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do

    erb :'/songs/new'
  end

  post '/songs' do
    # @song = Song.create()
    # redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    puts "Songs = #{Song.all.count} || Name = #{Song.first.name} || Slug = #{Song.first.slug} || Song = #{@song}"

    # puts "Params = #{params} || Slug = #{params[:slug]} || Song = #{@song}"
    erb :'/songs/show'
  end

end
