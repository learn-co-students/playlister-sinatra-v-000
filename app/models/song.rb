class Song< ActiveRecord::Base
  belongs_to :artist
  has_many :genres

  attr_reader :song_id
end
