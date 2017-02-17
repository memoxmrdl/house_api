class PropertySerializer < ActiveModel::Serializer
  attributes :id,
             :house_type,
             :title,
             :address,
             :zipcode,
             :country,
             :notes
end
