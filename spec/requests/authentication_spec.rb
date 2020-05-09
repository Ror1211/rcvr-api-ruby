require 'rails_helper'

RSpec.describe 'POST /login', type: :request do
  let(:owner) { FactoryBot.create(:owner) }
  let(:params) do
    {
      owner: {
        email: owner.email,
        password: owner.password
      }
    }
  end

  context 'when params are correct' do
    before do
      post '/login', params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    xit 'returns valid JWT token' do
      decoded_token = decoded_jwt_token_from_response(response)

      expect(decoded_token.first['sub']).to be_present
    end
  end

  context 'when login params are incorrect' do
    before { post '/login' }

    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end

RSpec.describe 'DELETE /logout', type: :request do
  it 'returns 204, no content' do
    delete '/logout'
    expect(response).to have_http_status(204)
  end
end
