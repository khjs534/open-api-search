class Theft < ApplicationRecord
  validates_presence_of :title, :description

  validates_length_of :title, maximum: 250
  validates_length_of :description, maximum: 1000

end
