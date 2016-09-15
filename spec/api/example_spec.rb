require 'spec_helper'

describe Example do
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

  describe 'GET /api/v1/posts/published' do
    it 'gets published posts' do
      get '/api/v1/posts/published'
      expect(last_response.status).to eq(200)
    end
  end

  describe 'POST /api/v1/posts' do
    context 'with missing required parameters' do
      it 'creates a post' do
        post '/api/v1/posts', title: FFaker::Movie.title
        expect(last_response.status).to eq(400)
      end
    end

    context 'given required parameters' do
      it 'creates a post' do
        post '/api/v1/posts', title: FFaker::Movie.title, body: FFaker::LoremFR.paragraph, published: true
        expect(last_response.status).to eq(201)
      end
    end
  end
end
