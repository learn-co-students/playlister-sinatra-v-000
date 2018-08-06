class ApplicationHelper

  def slug
    self.name.split.collect do |word|
      word.downcase
    end.join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").collect { |n| n.capitalize }.join(" ")

    self.find_by(name: name)
  end

end
