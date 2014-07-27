class Main < Sinatra::Base
  include Mongo

  YAML::load(File.open('config/database.yml'))[$env].symbolize_keys.each do |key, value|
    set key, value
  end

  configure do
    $conn = MongoClient.new(settings.host, settings.port)
    $db = $conn.db(settings.database)
    set :db, $db
  end

  get '/' do
    "Hello world."
  end
end
