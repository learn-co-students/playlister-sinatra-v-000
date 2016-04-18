module Slugifiable

  def self.included(base)
    base.extend(ClassMethods)
  end

  def slug
    parts = self.name.split(" ")
    parts.collect! {|part| part.downcase }
    parts.join("-")
  end

  module ClassMethods
    def find_by_slug(slug)
      parts = slug.split("-")
      parts.collect! {|part| part.capitalize }
      name_of_object = parts.join(" ")
      object = find_by(name: name_of_object)
      object
    end
  end
end