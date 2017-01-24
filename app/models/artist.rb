class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods


    has_many :songs
    has_many :genres, through: :songs
    #has_many => <#Artist>.songs || <#artist>.genres
    
end
