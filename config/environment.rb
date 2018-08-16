ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

module Concerns
  module Slugifiable
    def slug
      text = self.name.split(" ").join("-").downcase
    end
      
    def self.find_by_slug(text)
      text = text.split("-").join(" ").titleize
      self.find_by(:name => text)    
    end
  end
end

require_all 'app'
require_all 'lib'