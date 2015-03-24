require 'rails_helper'

RSpec.describe 'Groups endpoint' do
  context 'given current_user' do
    it 'should return their groups' do
      create(:group)
      get api_v1_groups_path
      expect(response.body).to include('Group 1')
    end

  end
end