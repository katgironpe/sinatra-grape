# Sinatra Grape Template

## What is this good for?

* Development of simple REST API for web, mobile and desktop applications
* Isolation of code for web services
* An alternative to having one big Rails application with cluttered routes
* Sanity

## Examples

* If you're writing an API implementation for various machine learning/ automation tasks, the best way is to isolate this and not make it a part of your probably bloated application
* REST API for specific mobile applications that may or may not rely another application

## Dependencies

* Ruby 2.1.2 or greater (but will probably work for 1.9.x)
* Grape
* Mongo
* Sinatra

## Getting Started

``` bash
$ git clone --depth 1 git://github.com/katgironpe/sinatra-grape.git myapp
$ rm -r myapp/.git && rm myapp/README.md
```

## MongoDB Configuration

Install MongoDB if you haven't yet.

```
brew install mongodb
```

Change the settings on `config/database.yml`


## Test Data

There's a rake task for loading test data.

```bash
rake db:seed
```

After loading that data, you can check /api/v1/posts.

Start the application:

```
shotgun config.ru
```

Use curl or probably just your browser to view the output:

```
curl http://localhost:9393/api/v1/posts
```

## Grape Entity

With **grape-entity**, you can expose only the fields you want and format them as needed.

## Testing

We can use RSpec and Rack::Test to test the API requests.

Here's an example:

```ruby
#example.rb
class Example < Grape::API
  prefix 'api'
  version 'v1'
  format :json

  get :hello do
    { hello: 'world' }
  end
end
```

We should make sure it returns correct status code and output:

```ruby
require 'spec_helper'

describe Example do
  include Rack::Test::Methods

  def app
    Example
  end

  describe 'GET /api/v1/hello' do
    it 'says hello to the world' do
      get '/api/v1/hello'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)['hello']).to eq('world')
    end
  end
end
```

Use the commands:

```bash
rake test
or
rspec .
```

### The Golden Rule of API Design

> It’s not enough to write tests for an API you develop; you have to write unit tests for code that uses your API.

> — Michael Feathers

### Documentation


### Relevant Links
  * http://recipes.sinatrarb.com/p/databases/mongo

### TO DO

* Work on the generators to make the process less tedious.
* Examples for POST and PATCH
* Documentation


### Have any questions/ suggestions?

#### Katherine Pe
* <a href='https://c.kat.pe' target='_blank'>c.kat.pe</a>
* <a href='https://google.com/+katherinepe' target='_blank'>Kat on Google+</a>
