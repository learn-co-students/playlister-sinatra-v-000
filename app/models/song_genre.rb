class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song

  extend SlugModule::ClassMethods
  include SlugModule::InstanceMethods
  
end
