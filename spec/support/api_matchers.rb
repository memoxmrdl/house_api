RSpec::Matchers.define :match_location_header do |regexp|
  match do |response|
    response.headers['location'] =~ regexp
  end

  failure_message do |response|
    location = response.headers['location']
    "expected #{location} to match #{regexp}"
  end
end