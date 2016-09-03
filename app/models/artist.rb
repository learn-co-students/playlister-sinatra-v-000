require_relative 'concerns/slugifiable.rb' #require slugifiable nested modules

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

end
