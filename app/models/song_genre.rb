class SongGenre < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  
  belongs_to :song 
  belongs_to :genre
end