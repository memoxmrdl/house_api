require 'rails_helper'

RSpec.describe 'Properties', type: :request do
  let!(:property)      { create(:property) }
  let!(:property_id)   { property.id }
  let!(:property_params)  { {} }
  let!(:request_url)   { "/properties/#{property_id}" }

  before(:each) do
    put request_url, params: params_for(:property, property_params)
  end

  describe 'PUT /properties/:id' do
    context 'with valid params' do
      let!(:property_params) do
        {
          country: 'mx',
          zipcode: '11111'
        }
      end

      it { expect(response).to have_http_status(200) }
      it { expect(response).to match_response_schema(:property, strict: true) }
      it { expect(response).to match_location_header(/\/properties\/\d+$/) }
    end

    context 'with invalid params' do
      let!(:property_params) do
        {
          country: 'esx',
          zipcode: '111113'
        }
      end

      it { expect(response).to have_http_status(400) }
    end
  end
end
