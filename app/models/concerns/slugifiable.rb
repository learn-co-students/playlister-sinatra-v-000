class Slugifiable
  def slug(name)
    new_name = name.downcase.strip.gsub(' ','-')
    new_name
  end
end
