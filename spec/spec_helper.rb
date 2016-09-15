ENV['RACK_ENV'] ||= 'test'

%w(
  ffaker
  rack/test
  rspec
  ./main
).each do |dep|
  require dep
end


Dir[('./spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |c|
  c.include Rack::Test::Methods
end
