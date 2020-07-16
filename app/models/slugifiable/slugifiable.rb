module Slugifiable
  def slug
    self.name.downcase.gsub!(/[^a-zA-Z]/, "-")
  end

  #def find_by_slug(slug)
  #  name = slug.split("-").each {|i| i.capitalize!}.join(" ")
  #  self.find_by_name(name)
  #end

  def find_by_slug(slug)
    match = ""
    self.all.each do |i|
      if i.slug == slug
        match = i
      end
    end
    match
  end

end
