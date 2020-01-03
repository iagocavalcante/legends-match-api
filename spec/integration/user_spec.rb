require 'swagger_helper'

describe 'Legends Match API' do

  path '/api/v1/login' do

    post 'User sign in' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter auth: :user, email: :user, password: :user, in: :body, schema: {
        type: :object,
        properties: {
          auth: { 
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            }
          }
        },
        required: [ 'auth', 'email', 'password' ]
      }

      response '201', 'token created' do
        let(:user) { { auth: { email: 'iagoc@mailinator.com', password: '12345678' } } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { email: 'foo' } }
        run_test!
      end
    end
  end
end
