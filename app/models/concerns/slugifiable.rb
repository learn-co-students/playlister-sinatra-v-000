class Slugifiable

  def initialize(name)
    @name = name
  end

  def slug
    @name.downcase.gsub(" ", "-")
  end

end
