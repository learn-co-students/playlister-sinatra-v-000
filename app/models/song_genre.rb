require_relative 'concerns/slugify.rb'

class SongGenre < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  belongs_to :song
  belongs_to :genre
end
