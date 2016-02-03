module Slug

  def slug
    name.gsub(" ", "-").downcase
  end
end