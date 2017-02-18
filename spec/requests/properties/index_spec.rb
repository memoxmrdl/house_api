require 'rails_helper'

RSpec.describe 'Properties', type: :request do
  let!(:properties)   { create_list(:property, 5) }
  let!(:request_url)  { "/properties" }

  describe 'GET /properties' do
    before(:each) do
      get request_url
    end

    it { expect(response).to have_http_status(200) }
    it { expect(response).to match_response_schema(:properties, strict: true) }
    it { expect(parsed_json).to eql serialization_for(properties) }
  end
end
