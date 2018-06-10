require_relative './slug.rb'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
