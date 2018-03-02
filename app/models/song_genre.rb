class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  include Slug::InstanceMethods
  extend Slug::ClassMethods
end
