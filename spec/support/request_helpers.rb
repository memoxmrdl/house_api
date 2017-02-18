module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def parsed_json
      json.deep_symbolize_keys
    end

    def params_for(key, hash)
      { key => hash }
    end

    def serialization_for(scope, options = {})
      serializable = ActiveModelSerializers::SerializableResource.new(scope, options)
      JSON.parse(serializable.to_json).deep_symbolize_keys
    end
  end
end
