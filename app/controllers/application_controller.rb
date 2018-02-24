class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end


  helpers do
    def slug
      self.name.gsub(" ", "-").downcase
    end

    def find_by_slug(slug)
      self.all.find { |instance| instance.slug == slug}
    end
  end

end
