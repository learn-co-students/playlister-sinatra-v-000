require_relative '../../lib/slug.rb'

class SongGenre < ActiveRecord::Base

  extend Slug::ClassMethods
  include Slug::InstanceMethods

  belongs_to :genre
  belongs_to :song
  


end
