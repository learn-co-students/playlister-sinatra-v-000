
module Concerns::Slugifiable 

  def slug
    slug = name.split(" ").join("-").downcase
  end

  def find_by_slug(slug)
    full_name = slug.split("-").join(" ")
    name_result = self.all.detect {|item| item.name.downcase == full_name}
  end
end
