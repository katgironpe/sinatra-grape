class Main < Sinatra::Base
  include Mongo

  YAML::load(File.open('config/database.yml'))[$env].symbolize_keys.each do |key, value|
    set key, value
  end

  configure do
    $db = Mongo::Client.new("mongodb://#{settings.mongodb_host}:#{settings.port}/#{settings.database}")
    set :db, $db
  end

  enable :sessions
  set :session_secret, settings.session_secret


  get '/' do
    "Hello world."
  end
end
