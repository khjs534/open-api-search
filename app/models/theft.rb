class Theft < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  validates :title, length: { maximum: 250 }
  validates :description, length: { maximum: 1000 }
end
