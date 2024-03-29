class Property < ApplicationRecord
  validates :title,
            :address,
            :zipcode,
            :country,
            :house_type, presence: true

  validates :country, length: { is: 2 }
  validates :country, inclusion: { in: %w(mx us ca) }
  validates :notes, length: { maximum: 300 }
  validates :title, length: { minimum: 15, maximum: 45 }
  validates :address, length: { minimum: 30, maximum: 140 }
  validates :zipcode, numericality: true, format: { with: /\A\d{5}-\d{4}|\A\d{5}\z/ }

  enum house_type: [:house, :departament]
end
