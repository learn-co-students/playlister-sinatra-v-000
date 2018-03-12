class Artist < ActiveRecord::Base
  require_relative '../../lib/slug_methods.rb'
  has_many :songs
  has_many :genres, through: :songs

  extend SlugMethods::ClassMethods
  include SlugMethods::InstanceMethods
end
