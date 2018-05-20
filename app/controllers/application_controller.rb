class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    # Build data only if not already built
      # seeds = LibraryParser.new
      # seeds.call
    erb :index
  end
end



# Referenced Labs
# sinatra-complex-forms-associations-v-000
# sinatra-restful-routes-lab-v-000
# sinatra-user-auth-v-000
