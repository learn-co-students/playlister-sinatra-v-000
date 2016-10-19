class ActiveRecord::Base

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |object|
      object.name.downcase.gsub(" ", "-") == slug
    end
  end
end
