genre_list = [
  "Pop",
  "Rap",
  "Gospel",
  "Stupidness"
]

genre_list.each do |name|
  Genre.create( name: name)
end
