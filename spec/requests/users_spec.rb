require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:example) { get(users_path) }
    it 'check status' do
      expect(response).to have_http_status(:ok)
  end
end