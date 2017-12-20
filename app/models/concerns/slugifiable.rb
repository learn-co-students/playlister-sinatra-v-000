module Slugifiable

  def slug
    if self.name
      self.name.downcase.gsub(/[ .]/, "-")
    end
  end

  def self.find_by_slug(name)
    self.detect do |object|
      object.slug == name
    end
  end
end
