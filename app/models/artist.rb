class Artist < ActiveRecord::Base
  extend Parser::ClassMethods
  include Parser::InstanceMethods

  has_many :songs, dependent: :destroy
  has_many :genres, through: :songs
end
