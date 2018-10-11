class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  helpers do 
    def slug
      name.gsub(' ','-').lowercase
    end

    def self.find_by_slug(slug)
      self.all.find { |e| e.slug == slug }
    end
  end
end