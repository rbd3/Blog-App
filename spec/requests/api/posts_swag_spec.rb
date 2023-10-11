describe 'GET /api/v1/posts' do
  it 'returns a list of posts' do
    get '/api/v1/posts'
    expect(response).to have_http_status(200)
    expect(response).to match_response_schema('posts')
  end

  # Use the 'swagger' DSL to document your endpoint
  path '/api/v1/posts' do
    get 'Retrieves a list of posts' do
      tags 'Posts'
      produces 'application/json'

      response '200', description: 'OK' do
        schema type: :array,
               items: { '$ref' => '#/definitions/post' }
      end
    end
  end
end
