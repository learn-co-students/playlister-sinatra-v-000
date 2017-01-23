class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

    attr_accessor :name

    has_many :songs
    has_many :genres, through: :songs
    #has_many => <#Artist>.songs || <#artist>.genres
    
end
