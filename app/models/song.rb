class Song < ActiveRecord::Base
  belongs_to :artist #belongs to ONE artist
  belongs_to :genres #belongs to multiple genres
end
