suede=Artist.create(name: "the london suede")
zeppelin=Artist.create(name: "Led Zeppelin")
xx=Artist.create(name: "The XX")

glam=Genre.create(name: "glam")
rock=Genre.create(name: "classic rock")
dance=Genre.create(name: "dance")


suede.songs << Song.create(name: "Stay Together")
suede.songs << Song.create(name: "Trash")

zeppelin.songs << Song.create(name: "The Immigrant Song")
xx.songs << Song.create(name: "VCR")

suede.songs.each{|s| s.genres << glam << rock}
zeppelin.songs.each{|s|s.genres << rock}
xx.songs.each{|s|s.genres<<dance}


