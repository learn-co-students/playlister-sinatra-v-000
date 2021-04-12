# Add seed data here. Seed your database with `rake db:seed`
#mumford = Artist.create(name: "Mumford & Sons")
#folk = Genre.create(name: "Folk")
#Song.create(name: "I Will Wait",  artist: mumford, genre: folk)

path = "./db/data"
files = Dir.glob(path + "/*.mp3").collect{|file| file.split(/.+\//).last}
artist = Artist.all
genre = Genre.all

files.each do |f|
  f_ary = f.split(/\s[\-]\s| \[|\].mp3/)
    f_artist = f_ary[0]
    f_song = f_ary[1]
    f_genre = f_ary[2]
  a = Artist.find_or_create_by(name: f_artist)
  g = Genre.find_or_create_by(name: f_genre)
  Song.find_or_create_by(name: f_song,  artist: a, genre: g)
end
