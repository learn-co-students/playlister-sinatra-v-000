What params hash looks like when user submits form to create a new song:

params = {
  "Name" => @name attribute value of song instance (whatever user entered in Name form field),
  "Artist Name" => @name attribute value of artist instance the new song instance belongs to (whatever user entered in Artist Name form field),
  "genres" => [array of @id attribute values of existing genre instances that the song instance belongs to]
}

* We knew that "Name" is a top-level key in params hash because the test suite, which uses Capybara, says: fill_in "Name", with: song_name, where song_name is the @name attribute value of song instance
* We knew that "Artist Name" is a top-level key in params hash b/c test suite says
fill_in "Artist Name", with: artist_name, where artist_name is the @name attribute value of artist instance

What params hash looks like when user submits form to edit a song:

params = {
  "song" => {
    "name" => "@name attribute value of song instance",
    "genre_ids" => [array of @id attribute values of genre instances that the song instance belongs to]
  },
  "artist" => {"name" => "@name attribute value of artist instance that the song instance belongs to"},
}

Explanation of params hash above:
* "song" top-level key of params hash points to (and stores) hash containing info about a song instance
(the song being edited in the form). Refer to this nested hash containing song data as the song hash.
* "name" key in the song hash (nested inside params hash) points to the @name attribute value of the song instance
* "genre_ids" key in song hash points to (and stores) an array of @id attribute values of existing genre instances (already saved to DB) that the song instance belongs to.
* "artist" top-level key in params hash points to (and stores) a hash (called artist hash) containing info about the artist instance that the song instance belongs to. The artist hash contains 1 key/value pair with @name attribute data of the artist instance either found or created


The Many-to-Many Relationship:
A genre instance has many song instances, and a single song instance can belong to multiple genre instances.
