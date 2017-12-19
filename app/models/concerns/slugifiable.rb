require 'pry'

module Slugifiable

#instance method - @artist.slug
#include Slugifiable::Instance
  module Instance
    def slug
      self.name.to_s.gsub(" ", "-").downcase
    end
  end

#class method - 'undefined method fbs for Artist'
#extend Slugifiable::Class
  module Class
    def find_by_slug(slug)
      slug = slug.split("-").map(&:capitalize)*' '
      self.all.find_by(name: slug)
    end
  end
end

=begin

describe "Class methods" do
  it "given the slug can find an Artist" do
    slug = "taylor-swift"
    expect((Artist.find_by_slug(slug)).name).to eq("Taylor Swift")
  end
end

=end
