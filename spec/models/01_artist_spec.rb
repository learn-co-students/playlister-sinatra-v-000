require 'spec_helper'

describe "Artist" do
  before do 
    @artist = Artist.create(:name => "Taylor Swift") 

    blank_space =  Song.create(:name => "Blank Space", :artist => @artist) 

    pop = Genre.create(:name => "Pop")

    blank_space.genre_ids = pop.id
    
  end
  it "can be initialized" do
    expect(@artist).to be_an_instance_of(Artist)
  end

  it "can have a name" do
    expect(@artist.name).to eq("Taylor Swift")
  end

  it "has many songs" do
    expect(@artist.songs.count).to eq(1)
  end

  it "can have many genres" do
    expect(@artist.genres.count).to eq(1)
  end

  it "can slugify its name" do
<<<<<<< HEAD

=======
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 4893c8254f01a1e7ac64050428c63757f1574e8d
=======

>>>>>>> origin
>>>>>>> 59fcdd050bdcb32ebe31b27573f12073bec2da82
    expect(@artist.slug).to eq("taylor-swift")
  end

  describe "Class methods" do
<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 4893c8254f01a1e7ac64050428c63757f1574e8d
=======
>>>>>>> origin
>>>>>>> 59fcdd050bdcb32ebe31b27573f12073bec2da82
    it "given the slug can find an Artist" do
      slug = "taylor-swift"
      expect((Artist.find_by_slug(slug)).name).to eq("Taylor Swift")
    end
  end

end
