require_relative './concerns/slug.rb'

class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  include Slug::InstanceMethod
  extend Slug::ClassMethod
end
