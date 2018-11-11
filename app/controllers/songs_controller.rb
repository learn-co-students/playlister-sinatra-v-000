class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @slug = Song.find_by_slug(params[:slug].gsub("-"," "))
    @artist = Artist.find(@slug.artist_id)
    erb :'songs/show'
  end

  get '/songs/new' do
    erb :'songs/new'
  end
end

# 
# <h1>Create a New Song</h1>
#  <form action="/songs" method="POST">
#   <label> Artist Name </label>
#   <input type="text" name="Artist Name"> </br>
#    <label> Song Name </label>
#   <input type="text" name="Name" id="Name"> </br>
#    <label> Genres </label>
#   <% Genre.all.each do |genre| %>
#     <input id="<%= genre.name %>" type="checkbox" name="genres[]" value="<%= genre.id %>">
#   <% end %></br>
#    <input type="submit" value="Create">
# </form>
