module Slug
  def slug
    name = self.name
    return name.downcase.split(" ").join("-")
  end
end
