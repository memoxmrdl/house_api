require 'rails_helper'

RSpec.describe 'Properties', type: :request do
  let!(:property)     { create(:property) }
  let!(:request_url)  { "/properties" }

  describe 'POST /properties' do
    context 'with valid params' do

      before(:each) do
        post request_url, params: params_for(:property, property_params)
      end

      let!(:property_params) do
        attributes_for(:property).merge(
          house_type: 'house',
          title: Faker::Lorem.paragraph.first(15),
          address: Faker::Lorem.paragraph.first(30),
          zipcode: Faker::Address.zip_code.first(5),
          country: 'mx',
          notes: Faker::Lorem.paragraph
        )
      end

      it { expect(response).to have_http_status(200) }
      it { expect(response).to match_response_schema(:property_attributes, strict: true) }
      it { expect(response).to match_location_header(/\/properties\/\d+$/) }
    end

    context 'with invalid params' do
      before(:each) do
        post request_url, params: params_for(:property, property_params)
      end

      let!(:property_params) do
        attributes_for(:property).merge(
          house_type: 'house',
          title: Faker::Lorem.paragraph.first(20),
          address: Faker::Lorem.paragraph.first(30),
          zipcode: Faker::Address.zip_code.first(2),
          country: 'mxx',
          notes: Faker::Lorem.paragraph
        )
      end

      it { expect(response).to have_http_status(400) }
    end
  end
end
