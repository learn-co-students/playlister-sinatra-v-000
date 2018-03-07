public_access_tv = Artist.create(name: "Public Access TV")
sufjan = Artist.create(name: "Sufjan Stevens")
white_reaper = Artist.create(name: "White Reaper")

mystery = Song.create(name: "Mystery of Love")
monaco = Song.create(name: "Monaco")
evil_disco = Song.create(name: "Evil Disco")

indie = Genre.create(name: "Indie")
garage_rock = Genre.create(name: "Rock")
indie_rock = Genre.create(name: "Indie Rock")

public_access_tv.songs << evil_disco
evil_disco.genres << garage_rock
public_access_tv.save

sufjan.songs << mystery
mystery.genres << indie
sufjan.save

white_reaper.songs << monaco
monaco.genres << indie_rock
white_reaper.save
