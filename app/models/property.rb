class Property < ApplicationRecord
  validates :type,
            :title,
            :address,
            :zipcode,
            :country, presence: true

  validates :country, length: { is: 2 }
  validates :notes, length: { maximum: 300 }
  validates :title, length: { minimum: 15, maximum: 45 }
  validates :address, length: { minimum: 30, maximum: 140 }
  validates :zipcode, numericality: true, format: { with: /\A\d{5}-\d{4}|\A\d{5}\z/ }

  enum type: [:house, :departament]
end
