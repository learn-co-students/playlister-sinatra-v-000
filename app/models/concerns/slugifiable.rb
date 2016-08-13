module Slugifiable

  def slug
    self.name.split(" ").map { |name| name.downcase }.join("-")
  end

end
