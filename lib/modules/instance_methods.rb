module InstanceMethods

  def slug
    self.name.downcase.split(" ").join("-")
  end

end
