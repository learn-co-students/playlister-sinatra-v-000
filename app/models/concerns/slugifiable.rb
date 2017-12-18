module Slugifiable

  def slug
    self.name.gsub(/[ .]/, "-")
  end

  def self.find_by_slug(name)
    self.all.detect do |object|
      binding.pry
      object.name.slug == name
    end
  end
end
