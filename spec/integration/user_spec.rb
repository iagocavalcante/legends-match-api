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
        it 'returns 201 when a user is signed in successfully' do
          user = { auth: { email: 'iagoc@mailinator.com', password: '12345678' } }
      
          expect(response.status).to eq(201)
        end
      end

      response '422', 'invalid request' do
        let(:user) { { email: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/me' do

    post 'User info' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter email: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
        },
        required: [ 'email' ]
      }

      response '200', 'users info returned' do
        it 'returns 200 when a user info returned successfully' do
          user = { email: 'iagoc@mailinator.com' }
      
          expect(response.status).to eq(200)
        end
      end

      response '422', 'invalid request' do
        let(:user) { { email: 'foo' } }
        run_test!
      end
    end
  end
end
