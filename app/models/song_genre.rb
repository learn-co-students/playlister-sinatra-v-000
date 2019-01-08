class SongGenre < ActiveRecord::Base
    belongs_to :genre
    belongs_to :song
  end
  
# class SongGenre < ActiveRecord::Base
#     belongs_to :genre
#     belongs_to :song 
# end
