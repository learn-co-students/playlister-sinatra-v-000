module Slugifiable

  def slug
    self.name.downcase.gsub(/[ .]/, "-")
  end

  def self.find_by_slug(name)
    self.detect do |object|
      object.slug == name
    end
  end
end
