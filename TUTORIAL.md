# Guide to Solving and Reviewing Playlister Sinatra

For this lab it is important that you run your spec files one by one or in numeric order. We are going to start with are model spec first.

## `spec/models/01_artist_spec.rb`

By typing `rspec spec/models/01_artist_spec.rb` in your command line you will just run the `01_artist_spec.rb` spec in your `spec/models` file. You can even chain the `--fail-fast` to it.

```bash
Artist
  can be initialized (FAILED - 1)

Failures:

  1) Artist can be initialized
     Failure/Error: let!(:artist) { Artist.create(:name => "Taylor Swift") }
     NameError:
       uninitialized constant Artist
```

Lets create our Artist Model `artist.rb` in our `app/model` folder.

```ruby
class Artist < ActiveRecord::Base
end
```

Run `rspec spec/models/01_artist_spec.rb --fail-fast` again and you will notice the test is still not passing but you have a new error message.

```bash
Artist
  can be initialized (FAILED - 1)

Failures:

  1) Artist can be initialized
     Failure/Error: let!(:artist) { Artist.create(:name => "Taylor Swift") }
     ActiveRecord::StatementInvalid:
       Could not find table 'artists'
```

To create a table for the artists type `rake db:create_migration NAME=create_artists` in your bash. After hitting enter the outline of our migration file should be in your `db/migrate` folder. We still need to add the `name` attribute to our schema.

```ruby
class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
    end
  end
end
```

Lets migrate our test database now by running `rake db:migrate SINATRA_ENV=test`.

Our test is still not passing, but now it is telling us `uninitialized constant Song`. Let's setup our `song.rb` in our `app/model` folder and after that let us also create our songs table with the `name` attribute.

```ruby
class Song < ActiveRecord::Base
end
```

```ruby
class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
    end
  end
end
```

After migrating our table we are getting a new error message `unknown attribute 'artist' for Song`. This means we created our song and artist models but did not associate them.

Lets thing about this for a minute. An artist can `has_many` songs and a song `belongs_to` an artist. Whenever we have a `belong_to` in our model we also have to add a foreign key to to that table.

For us that means we need to add `artist_id` column to our songs table. To do this we need to alter our `songs` table. But we cannot just go to our existing migration and add a column. We need to write a new migration which adds the the new field by typing `rake db:create_migration NAME=add_artist_to_songs` this again will just give us a outline of our migration. To add `artists_id` to your table, your migration file should look like this.

```ruby
class AddArtistToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :artist_id, :integer
  end
end
```

The new error message we are getting is `uninitialized constant Genre`. We need to create `genre.rb` file in the `app/model` folder and we also need to create the genres table.

```ruby
class Genre < ActiveRecord::Base
end
```

```ruby
class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
    end
  end
end
```

After running rspec again we are getting `uninitialized constant SongGenre`. This is because a Song can have multiple Genres. To persist this we need to create a joined table and model `song_genre.rb`.

```ruby
class SongGenre < ActiveRecord::Base
end
```

```ruby
class CreateSongGenres < ActiveRecord::Migration
  def change
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
```

Run rspec again

```bash
Artist
  ..
  can have many genres (FAILED - 1)

Failures:

  1) Artist can have many genres
     Failure/Error: expect(artist.genres.count).to eq(2)
     NoMethodError:
       undefined method `genres' for #<Artist id: 1, name: "Taylor Swift">
```

We need more associates here to pass this test. How are our models connected?

- An artists `has_many :songs` and `has_many :genres, :through => :songs`.
- A song `belongs_to :artist`, `has_many :song_genres` and `has_many :genres, :through => :song_genres`.
- A genre `has_many :song_genres`, `has_many :songs, :through => :song_genres` and `has_many :artists, :through => :songs`.
- A song_genre `belongs_to :genre` and `belongs_to :song`.

Now when we run the rspec, you will notice that four of our test are passing

```bash
Artist
..
  can slugify it's name (FAILED - 1)

Failures:

  1) Artist can slugify it's name
     Failure/Error: artist.slug
     NoMethodError:
       undefined method `slug' for #<Artist id: 1, name: "Taylor Swift">
```

To pass this spec we need to write a method slug. This method should slugify the models name.

```ruby
def slug
  name.downcase.gsub(" ","-")
end
```

Our last spec for our Actors model is

```bash
Artist
 ..
  Class methods
    given the slug can find a Artist (FAILED - 1)

Failures:

  1) Artist Class methods given the slug can find a Artist
     Failure/Error: Artist.find_by_slug(artist.slug)
     NoMethodError:
       undefined method `find_by_slug' for Artist(id: integer, name: string):Class
```

From the error message we can see that this method `find_by_slug` should be a class method. Given a slug this method will find the corresponding artist object.

```ruby
def self.find_by_slug(slug)
  Artist.all.find{|artist| artist.slug == slug}
end
```

## `rspec spec/models/02_song_spec.rb`

After running `rspec spec/models/02_song_spec.rb` we will notice that four of our six specs are already passing for our Song model.

```bash
Song
..
  can slugify it's name (FAILED - 1)


Failures:

  1) Song can slugify it's name
     Failure/Error: song.slug
     NoMethodError:
       undefined method `slug' for #<Song id: 1, name: "Blank Space", artist_id: 1>
```

To pass this this tests we have to add a define a `slug` method like in our Artist model.

```ruby
def slug
  name.downcase.gsub(" ","-")
end
```

We also have to define a class method `find_by_slug`.

```ruby
def self.find_by_slug(slug)
  Song.all.find{|artist| artist.slug == slug}
end
```

All our test for this model are passing now.

## `rspec spec/models/03_genre_spec.rb`

Like the Actor and Song model we need to define a `slug` method and a class method `find_by_slug`. Your Genre model should look like this.

```ruby
class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Genre.all.find{|genre| genre.slug == slug}
  end
end
```

All our model specs are passing now.

## `rspec spec/features/04_basic_view_spec.rb`

#### index pages /songs

Run `rspec spec/features/04_basic_view_spec.rb --fail-fast` to get your first error message.

```bash
Playlister Basics
  index pages
    /songs
      responds with a 200 status code (FAILED - 1)

Failures:

  1) Playlister Basics index pages /songs responds with a 200 status code
     Failure/Error: expect(page.status_code).to eq(200)

       expected: 200
            got: 404
```

Let's start with adding a `songs_controller.rb` to our `app/controllers` and also add the route to our index page into that controller.

```ruby
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

end
```

Add a `songs` folder with a `index.erb` file to your `app/views` folder.

For our app to load our controller we need to add it to the `config.ru` file.

```ruby
use Rack::MethodOverride
use SongsController
run ApplicationController
```

Now our first test should be passing.

```bash
Playlister Basics
  index pages
    /songs
      ..
      displays a list of songs (FAILED - 1)

Failures:

  1) Playlister Basics index pages /songs displays a list of songs
     Failure/Error: expect(page).to have_content(song_name)
       expected #has_content?("That One with the Guitar") to return true, got false
```

Before we add any code to our `index.erb` we should seed our production database. We already have a file `LibraryParser.rb` in our `lib` folder that does all the work for us. Which is turning all the files in our `db/data` in to objects that we can use to seed our database.

Add this code to your `db/seeds.rb` file

```ruby
LibraryParser.parse
```

and run `rake db:seed`.

Now we can build out our `index.erb`.

```html
<% @songs.each do |song| %>
  <li> <a href="/songs/<%= song.slug %>"> <%= song.name %> </a></li>
<% end %>
```

The songs index page test are passing now, We need to recreate all the steps for the artists index page.

#### index pages /artists

Add a `artists_controller.rb` to our `app/controllers` and also add the route to our index page into that controller.

```ruby
class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb:'artists/index'
  end

end
```

Add a `artists` folder with a `index.erb` file to your `app/views` folder.

For our app to load our controller we need to add it to the `config.ru` file.

```ruby
use Rack::MethodOverride
use SongsController
use ArtistsController
run ApplicationController
```

Build out the `artists/index.erb`.

```html
<% @artists.each do |artist| %>
  <li> <a href="/artists/<%= artist.slug %>"> <%= artist.name %> </a></li>
<% end %>
```

#### index pages /genres

Take again the same steps to create the genres index page.

- add `genres_controller.rb` to your controller folder
- add the route to your controller
- add a `genres` folder to your views and add a `index.erb` file into that folder
- add your controller to your `config.ru` file.
- add your code to your `index.erb`

#### show pages /songs/:slug

First add your new route to your controller, we can use our class method here.

```ruby
get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  erb :'songs/show'
end
```

Add a new file `show.erb` to your `views/songs`

```html
<h1> <%= @song.name %> </h1>

<a href="/artists/<%= @song.artist.slug %>"> <%= @song.artist.name %> </a>

<% @song.genres.each do |genre| %>
  <a href="/genres/<%= genre.slug %>"><%= genre.name %> </a>
<% end %>
```

#### show pages /artists/:slug

Same as the `/songs/:slug`

- add your new route to your contoller

```ruby
get '/artists/:slug' do
  @artist = Artist.find_by_slug(params[:slug])
  erb :'artists/show'
end
```

- add a new file `show.erb` to your `views/artists`

```ruby
<ul>
  <% @artist.songs.each do |song| %>
    <li><a href="/songs/<%= song.slug %>"><%= song.name %> </a></li>
  <% end %>
</ul>

<ul>
  <% @artist.genres.each do |genre| %>
    <li><a href="/genres/<%= genre.slug %>"><%= genre.name %> </a></li>
  <% end %>
</ul>
```

#### show pages /genres/:slug

Same as the `/songs/:slug` and `/artists/:slug`

- add your new route to your contoller

```ruby
get '/genres/:slug' do
  @genre = Genre.find_by_slug(params[:slug])
  erb :'/genres/show'
end
```

- add a new file `show.erb` to your `views/genres`

```ruby
<ul>
  <% @genre.songs.each do |song| %>
    <li><a href="/songs/<%= song.slug %>"><%= song.name %> </a></li>
  <% end %>
</ul>

<ul>
  <% @genre.artists.each do |artist| %>
    <li><a href="/artists/<%= artist.slug %>"><%= artist.name %> </a></li>
  <% end %>
</ul>
```

Now all our specs for `spec/features/04_basic_view_spec.rb` are passing!

## `rspec spec/features/05_song_form_spec.rb`

```bash
Song Forms
  /songs/new
    without an existing artist
      creates a new song and a new artist and associates them (FAILED - 1)

Failures:

  1) Song Forms /songs/new without an existing artist creates a new song and a new artist and associates them
     Failure/Error: visit "/songs/new"
     NoMethodError:
       undefined method `join' for #<String:0x007fb93d686c78>
```

We will start to solve this test by adding a new route to our songs model. The `'/songs/new'` route will render the new form to our user.

```ruby
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end
```

It is important that the `/songs/new` route is before `/songs/:slug`, else you will get an error.

```bash
Song Forms
  /songs/new
    without an existing artist
      creates a new song and a new artist and associates them (FAILED - 1)

Failures:

  1) Song Forms /songs/new without an existing artist creates a new song and a new artist and associates them
     Failure/Error: expect(page).to have_content(song_name)
       expected #has_content?("That One with the Guitar") to return true, got false
```

To pass our newest error message we need to add our `new.erb` file to our `views/songs' folder

```html
<h1>Add a New Song</h1>

<form action="/songs" method="POST">
  <label> Artist Name </label>
  <input type="text" name="Artist Name"> </br>

  <label> Song Name </label>
  <input type="text" name="Name"> </br>

  <label> Genres </label>
  <% Genre.all.each do |genre| %>
    <input id="<%= genre.name %>" type="checkbox" name="genres[]" value="<%= genre.id %>">
  <% end %>

  <input type="submit" value="Create">
</form>
```

We are still getting the same error message, because our app does not know what to do after we submitted the form. For this we need a new route `post '/songs'`.

This new route will create a new song with the title we entered into our form. If the artist exists in our database it will take that artists and use that as the songs artist or if the artists does not exist it will create a new artist with the name we added to our form and add all the genres we clicked on our form.

```ruby
post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    erb :'songs/show'
  end
```

Now the test requires a message for this we need to modify our `songs/show` page

```html
<% unless locals.empty? %>
  <%= message %>
<% end %>

<h1> <%= @song.name %> </h1>

<a href="/artists/<%= @song.artist.slug %>"> <%= @song.artist.name %> </a>

<% @song.genres.each do |genre| %>
  <a href="/genres/<%= genre.slug %>"><%= genre.name %> </a>
<% end %>
```

and our `post '/songs'` route

```ruby
post '/songs' do
  @song = Song.create(:name => params["Name"])
  @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
  @song.genre_ids = params[:genres]
  @song.save

  erb :'songs/show', locals: {message: "Successfully created song."}
end
```

Two of our specs are passing. Our next error message is

```bash
Song Forms
  ..
  /songs/:slug/edit
    changing a song's artist
      has a checkbox element on the form (FAILED - 1)

Failures:

  1) Song Forms /songs/:slug/edit changing a song's artist has a checkbox element on the form
     Failure/Error: expect(page.body).to include("checkbox")
```

Add the route below to your controller

```ruby
get '/songs/:slug/edit' do
  @song = Song.find_by_slug(params[:slug])

  erb :'songs/edit'
end
```

and add a `edit.erb` file to your `views/songs` folder

```html
<h1>Edit <%= @song.name %></h1>

<form action="/songs/<%= @song.slug %>" method="POST">
  <input type="hidden" name="_method" value="PATCH">

  <label for="name">Name</label>
  <input type="text" name="song[name]" id="name" value="<%= @song.name %>">

  <label for="artist_name">Artist Name</label>
  <input type="text" name="artist[name]" value="<%= @song.artist.name %>" id="artist_name">

  <% Genre.all.each do |genre| %>
    <label><%= genre.name %></label>
    <input type="checkbox" name="song[genre_ids][]" value="<%= genre.id %>" id="<%= genre.name %>" <%='checked' if @song.genres.include?(genre) %>>
  <% end %>

  <input type="submit" value="Save">
</form>
```

and also

```ruby
get '/songs/:slug/edit' do
  @song = Song.find_by_slug(params[:slug])

  erb :'songs/edit'
end

patch '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])

  @song.update(params[:song])

  @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
  @song.save

  erb :'songs/show', locals: {message: "Song successfully updated."}
end
```

to our controller.

And if your run `rspec` now all of the test should be passing.
