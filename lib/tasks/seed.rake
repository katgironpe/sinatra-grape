require './dependencies'
require './main'

namespace :db do
  desc 'Load test data'
  task :seed do
    $db['posts'].remove
    posts = $db['posts']

    published = { title: 'The Golden Role of API Design', body: 'It’s not enough to write tests for an API you develop; you have to write unit tests for code that uses your API.', published: true }
    not_published =  { title: 'A post not published', body: 'Ran out of quotes', published: false }

    posts.insert_one(published)
    posts.insert_one(not_published)

    puts 'Created posts'
  end
end
