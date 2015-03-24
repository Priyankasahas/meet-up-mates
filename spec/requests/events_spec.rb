require 'rails_helper'

RSpec.describe 'Events endpoint' do
  context 'given group' do
    it 'should return the group events' do
      group = create(:group, :with_events)
      get api_v1_events_path group_id: group.id
      expect(response.body).to include('lorem ipsum')
    end
  end
end