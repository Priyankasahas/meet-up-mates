require 'rails_helper'

RSpec.describe User do
  context '.user_by_email' do
    context 'given valid email' do
      it 'should return the user' do
        user = create(:user)
        expect(User.user_by_email('pri@example.com')).to eq user
      end
    end

    context 'given invalid email' do
      it 'should return nil' do
        expect(User.user_by_email('bob@example.com')).to eq nil
      end
    end
  end
end
