class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  self.include Slug::InstanceMethods
  self.extend Slug::ClassMethods
end