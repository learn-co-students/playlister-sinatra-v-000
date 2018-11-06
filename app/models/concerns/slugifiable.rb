module Slugifiable
  extend self

module InstanceMethods
  def slug
    slug = self.name.gsub("/[\p{P}\p{S}]/")
    slug = slug.gsub(" ","_")
    slug
  end
end

end
