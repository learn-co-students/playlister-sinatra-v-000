require 'spec_helper'

describe "Song Forms" do
  let(:artist_name) { "Person with a Face" }
  let(:genre_1_name) { "New Age Garbage" }
  let(:genre_2_name) { "Hippity Hop" }
  let(:song_name) { "That One with the Guitar" }
  let!(:genre_1) { Genre.create(name: genre_1_name) }
  let!(:genre_2) { Genre.create(name: genre_2_name) }

  describe "/songs/new" do
    before do
      visit "/songs/new"
    end

    context "without an existing artist" do
      it "creates a new song and a new artist and associates them" do
        fill_in "Name", with: song_name
        check "New Age Garbage"
        fill_in "Artist Name", with: artist_name
        click_on "Create"

        expect(page).to have_content(song_name)
        expect(page).to have_content(artist_name)
        expect(page).to have_content(genre_1_name)
        expect(page).to have_content("Successfully created song.")
      end
    end

    context "with an existing artist" do
      before do
        artist = Artist.create(name: artist_name)
      end

      it "creates a new song and associates it with an existing artist" do
        fill_in "Name", with: song_name
        check "Hippity Hop"
        fill_in "Artist Name", with: artist_name
        click_on "Create"

        expect(page).to have_content(song_name)
        expect(page).to have_content(artist_name)
        expect(page).to have_content(genre_2_name)
        expect(page).to have_content("Successfully created song.")
      end
    end
  end

  describe "/songs/:slug/edit" do
    before do
      @song = Song.create(name: song_name)
      artist = Artist.create(name: artist_name)

      @song.song_genres.create(genre: genre_1)
      @song.artist = artist

      @song.save

      visit "/songs/#{@song.slug}/edit"
    end

    context "changing a song's artist" do
      it "has a checkbox element on the form" do
        expect(page.body).to include("checkbox")
      end

      it "updates the song's artist" do
        fill_in "Artist Name", with: "Some Nobody"
        click_on "Save"

        expect(page).to have_content("Song successfully updated.")
        expect(page).to have_content(song_name)
        expect(page).to have_content("Some Nobody")
      end
    end

    context "changing a song's genres" do
      it "has a checkbox element on the form" do
        expect(page.body).to include("checkbox")
      end

      it "updates the song's genres" do
        uncheck "New Age Garbage"
        check "Hippity Hop"
        click_on "Save"

        expect(page).to have_content("Song successfully updated.")
        expect(page).to have_content(song_name)
        expect(page).to have_content(artist_name)
      end
    end
  end
end

