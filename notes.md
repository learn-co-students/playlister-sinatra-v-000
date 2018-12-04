Everythings working, but talking through this extensively feels like it's going to be very necessary.
One not required bug fix (maybe to ask Howard in class tomorrow): I'm getting repeats in my list for artist/genre when I make new songs for an existing artist with the same genre. How do I add a .uniq to an erb tag logic?

Cleaned up question:
On views/artist/show page, it’s listing the genre’s as songs are created, but if I make two songs for the same artist with the same genre, then it lists that genre twice. How can I add a .uniq method to my erb tags such that it will only list it once?


Figured it out: looks like you can add it to the @artists.genres.uniq.each do |genre|
												                                          ^^^ here =)
