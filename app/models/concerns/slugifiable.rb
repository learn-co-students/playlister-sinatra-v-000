require 'pry'

# slug module

module Slugifiable

  def slug
    binding.pry
    self.name.gsub(" ","-").downcase
  end
end

module Slugifiable
  def find_by_slug(name)
    name = name.gsub("-"," ").split
    first_name = name[0].capitalize
    last_name = name[1].capitalize
    name = [first_name, last_name].join(" ")
    self.find_by(name: name)
  end
end
