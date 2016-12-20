
module Slugifiable

  def self.included(base)
   base.extend(ClassMethods)
 end

  def slug
    self.name.split(" ").join("-").downcase
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect {|x| x.slug == slug}
    end
  end
end
