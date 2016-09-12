class Main < Sinatra::Base
  include Mongo

  YAML.load(ERB.new(File.read('./config/database.yml')).result)[$env].each do |key, value|
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
