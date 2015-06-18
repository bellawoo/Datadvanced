require 'sinatra/base'
# require 'tilt/erubis' # Fixes a warning
require 'pry'
require 'haversine'

require './db/setup'
require './lib/all'

require './wmata_api.rb'
require './bikeshare_api.rb'

class RubyLineApp < Sinatra::Base
  enable :logging
  enable :method_override
  enable :sessions

  set :session_secret, (ENV["SESSION_SECRET"] || "development")

  after do
    ActiveRecord::Base.connection.close
  end

end

RubyLineApp.run! if $PROGRAM_NAME == __FILE__