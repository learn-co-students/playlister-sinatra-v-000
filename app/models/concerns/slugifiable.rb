module Slugifiable

  def slug
    self.name.downcase.gsub(/[ .]/, "-")
  end

  def self.find_by_slug(name)
    binding.pry
    self.detect do |object|
      binding.pry
      object.slug == name
    end
  end
end
