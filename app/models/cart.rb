class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :partner
end
