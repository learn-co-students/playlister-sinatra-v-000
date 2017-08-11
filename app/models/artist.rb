require_relative './concerns/slug.rb'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slug::InstanceMethod
  extend Slug::ClassMethod
end
