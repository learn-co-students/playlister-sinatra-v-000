require_relative 'concerns/slugifiable.rb'
class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  validates :name, presence: true
  has_many :songs
end
