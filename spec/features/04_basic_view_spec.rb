require 'spec_helper'

describe "Playlister Basics" do
  let(:artist_name) { "Person with a Face" }
  let(:genre_name) { "New Age Garbage" }
  let(:song_name) { "That One with the Guitar" }

  # added-start
  let(:slug_name) { "that-one-with-the-guitar" }
  let(:slug_genre) { "new-age-garbage" }
  let(:slug_artist) { "person-with-a-face" }
  # added-end

  before do
    # edited to add url_slug
    @song = Song.create(name: song_name, url_slug: slug_name)
    @genre = Genre.create(name: genre_name, url_slug: slug_genre)
    @artist = Artist.create(name: artist_name, url_slug: slug_artist)

    @song.song_genres.create(genre: @genre)
    @song.artist = @artist
    @song.genre = @genre # added
    @song.save
    # added-start
    @artist.genre_id = @genre.id
    @artist.save
    @genre.song_id = @song.id
    @genre.artist_id = @artist.id
    @genre.save
    # added-end
  end

  describe "index pages" do
    describe "/songs" do
      before do
        visit "/songs"
      end

      it 'responds with a 200 status code' do
        expect(page.status_code).to eq(200)
      end

      it "displays a list of songs" do
        expect(page).to have_content(song_name)
      end

      it "contains links to each song's show page" do
        expect(page).to have_css("a[href='/songs/#{@song.slug}']")
      end
    end

    describe "/artists" do
      before do
        visit "/artists"
      end

      it 'responds with a 200 status code' do
        expect(page.status_code).to eq(200)
      end

      it "displays a list of artists" do
        expect(page).to have_content(artist_name)
      end

      it "contains links to each artist's show page" do
        expect(page).to have_css("a[href='/artists/#{@artist.slug}']")
      end
    end

    describe "/genres" do
      before do
        visit "/genres"
      end

      it 'responds with a 200 status code' do
        expect(page.status_code).to eq(200)
      end

      it "displays a list of genres" do
        expect(page).to have_content(genre_name)
      end

      it "contains links to each genre's show page" do
        expect(page).to have_css("a[href='/genres/#{@genre.slug}']")
      end
    end
  end

  describe "show pages" do
    describe "/songs/:slug" do
      before do
        visit "/songs/#{@song.slug}"
      end

      it 'responds with a 200 status code' do
        expect(page.status_code).to eq(200)
      end

      it "displays the song's artist" do
        expect(page).to have_content(artist_name)
      end

      it "displays the song's genres" do
        expect(page).to have_content(genre_name)
      end

      it "contains links to the artist's show page" do
        expect(page).to have_css("a[href='/artists/#{@artist.slug}']")
      end

      it "contains links to each genre's show page" do
        expect(page).to have_css("a[href='/genres/#{@genre.slug}']")
      end
    end

    describe "/artists/:slug" do
      before do
        visit "/artists/#{@artist.slug}"
      end

      it 'responds with a 200 status code' do
        expect(page.status_code).to eq(200)
      end

      it "displays the artist's songs" do
        expect(page).to have_content(song_name)
      end

      it "displays the artist's genres" do
        expect(page).to have_content(genre_name)
      end

      it "contains links to each song's show page" do
        expect(page).to have_css("a[href='/songs/#{@song.slug}']")
      end

      it "contains links to each genre's show page" do
        expect(page).to have_css("a[href='/genres/#{@genre.slug}']")
      end
    end

    describe "/genres/:slug" do
      before do
        visit "/genres/#{@genre.slug}"
      end

      it 'responds with a 200 status code' do
        expect(page.status_code).to eq(200)
      end

      it "displays the genre's artists" do
        expect(page).to have_content(artist_name)
      end

      it "displays the genre's songs" do
        expect(page).to have_content(song_name)
      end

      it "contains links to each artist's show page" do
        expect(page).to have_css("a[href='/artists/#{@artist.slug}']")
      end

      it "contains links to each song's show page" do
        expect(page).to have_css("a[href='/songs/#{@song.slug}']")
      end
    end
  end
end
