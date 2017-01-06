class Artist < ActiveRecord::Base

  include Concerns::Slugifiable::InstanceMethods
  extend Concerns::Slugifiable::ClassMethods

  has_many :songs
  has_many :genres, through: :songs
end

# Consider revising this and the other models' associations per https://learn.co/tracks/full-stack-web-development/sinatra/activerecord/activerecord-associations-join-tables
