class SongGenre < ActiveRecord::Base
  include Slug::InstanceMethods
  extend Slug::ClassMethods

  belongs_to :song
  belongs_to :genre
end
