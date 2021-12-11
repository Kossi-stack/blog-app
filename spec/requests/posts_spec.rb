require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    before(:example) { get('/users/365/posts') }
    it 'check status' do
      expect(response).to have_http_status(:ok)
  end
end
