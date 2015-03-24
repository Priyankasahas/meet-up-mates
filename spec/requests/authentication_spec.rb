require 'rails_helper'

RSpec.describe 'Authentication endpoint' do
  context 'sign in' do
    context 'given valid credentials' do
      it 'should return status code 200' do
        user = create(:user)
        post api_v1_user_session_path email: user.email, password: user.password
        expect(response).to have_http_status(:ok)
      end
    end

    context 'given invalid credentials' do
      it 'should return status code 401' do
        post api_v1_user_session_path user: {email: 'bob@example.com', password: 'Password123'}
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'given no credentials' do
      it 'should return status code 422' do
        post api_v1_user_session_path
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'sign out'
end