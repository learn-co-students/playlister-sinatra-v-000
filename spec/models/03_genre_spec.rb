require 'spec_helper'

describe "Genre" do
  before do 
    @artist = Artist.create(:name => "Taylor Swift") 

    blank_space =  Song.create(:name => "Blank Space", :artist => @artist) 

    @genre = Genre.create(:name => "Pop")

    blank_space.genre_ids = @genre.id
    
  end


  it "can initialize a genre" do
    expect(Genre.new).to be_an_instance_of(Genre)
  end

  it "has a name" do
    expect(@genre.name).to eq("Pop")
  end

  it "has many songs" do
    expect(@genre.songs.count).to eq(1)
  end

  it "has many artists" do
    expect(@genre.artists.count).to eq(1)
  end

<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 4893c8254f01a1e7ac64050428c63757f1574e8d
=======
>>>>>>> origin
>>>>>>> 59fcdd050bdcb32ebe31b27573f12073bec2da82
  it "can slugify its name" do
    genre = Genre.create(:name => "Alternative Rock")

    expect(genre.slug).to eq("alternative-rock")
  end

  describe "Class methods" do
    it "given the slug can find a genre" do
      genre = Genre.create(:name => "Alternative Rock")
      slug = "alternative-rock"
      expect((Genre.find_by_slug(slug)).name).to eq("Alternative Rock")
    end
  end
<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 4893c8254f01a1e7ac64050428c63757f1574e8d
=======
>>>>>>> origin
>>>>>>> 59fcdd050bdcb32ebe31b27573f12073bec2da82
end
