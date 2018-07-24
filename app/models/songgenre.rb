
class SongGenre < ActiveRecord::Base
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  belongs_to :song
  belongs_to :genre
end