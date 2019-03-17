class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions #this was needed
  # /usr/local/rvm/gems/ruby-2.6.1/gems/capybara-3.14.0/lib/capybara/session.rb:744:in `block (2 levels) in <class:Session>'
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end

#you gotta use the other controller files in the config.ru file
