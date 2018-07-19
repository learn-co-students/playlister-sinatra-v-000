
class Test < ApplicationController

get "/hello" do
  "hello"
end

get '/set-flash' do
  flash[:message] = "Thanks for signing up!"
  erb :set_flash
end

end
