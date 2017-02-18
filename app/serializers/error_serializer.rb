class ErrorSerializer < ActiveModel::Serializer
  attributes  :message,
              :response

  def response
    false
  end

  def message
    object.errors.full_messages.join(', ')
  end
end
