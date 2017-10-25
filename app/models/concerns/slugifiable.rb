class Slugifiable
  def slug(instance)
    instance.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(text, klass)
    klass.all.find {|instance| instance.slug == text}
    #Artist.find_by_name(text.split("-").collect {|text| text.capitalize}.join(" "))
  end
end