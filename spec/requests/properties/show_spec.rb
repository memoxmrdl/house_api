require 'rails_helper'

RSpec.describe 'Properties', type: :request do
  let!(:property)        { create(:property) }
  let!(:property_id)     { property.id }
  let!(:request_url)  { "/properties/#{property_id}" }

  before(:each) do
    get request_url
  end

  describe 'GET /properties/:id' do
    context 'when property exists' do
      it { expect(response).to have_http_status(200) }
      it { expect(response).to match_response_schema(:property, strict: true) }
    end

    context 'when property does not exist' do
      let!(:property_id) { -1 }

      it { expect(response).to have_http_status(404) }
    end
  end
end
