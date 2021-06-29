require 'rails_helper'

RSpec.describe 'Attendances', type: :request do
  describe 'GET /destroy' do
    it 'returns http success' do
      get '/attendances/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
