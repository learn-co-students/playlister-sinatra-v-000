
# NOTE : Temp Code that has been removed for testing purposes from erb files thanks to comments not working
#
# <h2>Artist Name: <%= @artist.name %> </h2>
#
# <h3>Artist Songs:</h3>
#
# <ul>
#   <% @artists.songs.each do |song| %>
#     <li><a href="/songs/<%= song.slug %>"><%= song.name %></a></li>
#   <% end %>
# </ul>
#
# <h3>Artist Genres:</h3>
#
# <ul>
#   <% @song_genres.each do |song_genre| %>
#     <% if song_genre.song_id == @song.id%>
#       <li><a href="/genres/<%= song_genre.genre.slug %>"><%= song_genre.genre.name %></a></li>
#     <% end %>
#   <% end %>
# </ul>
