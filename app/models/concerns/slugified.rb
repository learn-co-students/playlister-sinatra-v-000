module Slugified
module InstanceMethods

def slug
  self.name.downcase.split.join("-")
end #of slug
end #of InstanceMethods

module ClassMethods

  def find_by_slug(slug)
    self.all.detect { |object_song| object_song.slug == slug }
end #of find_by_slug
end #of ClassMethods
end #of Slugified
