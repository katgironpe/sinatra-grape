class Example < Grape::API
  prefix 'api'
  version 'v1'
  format :json

  get :hello do
    { hello: 'world' }
  end

  resources :posts do
    desc 'Returns published posts.'
    get :published do
      $db['posts'].find({ published: true }).to_a
    end

    desc 'Create a post.'
    params do
      requires :title, type: String, desc: 'Post title.'
      requires :body, type: String, desc: 'Post body.'
      requires :published, type: Boolean, desc: 'Post publish status.'
    end

    post do
      post = { title: params[:title], body: params[:body], published: true }
      $db['posts'].insert_one(post)
    end
  end
end
