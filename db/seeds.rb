Artist.create(name: "A$AP Rocky")
Artist.create(name: "We Found Love")

Genre.create(name: "dance")
Genre.create(name: "hip-hop")
Genre.create(name: "r&b")

Song.create(:name => "Peso", :artist[:name] => "A$AP Rocky", :genre[:names][] => "dance")
Song.create(:name => "We Found Love", :artist[:name] => "Rihanna", :genre[:names][] => "hip-hop", :genre[:names][] => "r&b")
