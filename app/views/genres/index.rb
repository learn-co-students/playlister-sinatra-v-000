<h1>All Genres</h1>
<ul>
<% @genres.each do |genre| %>
  <li><a href="/genres/<%= genre.slug %>"><%= genre.name %></a></li>
<% end %>
</ul>