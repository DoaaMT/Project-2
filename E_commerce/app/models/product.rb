class Product < ApplicationRecord
    belongs_to :user
 #   belongs_to :order
    has_many :orders, dependent: :destroy
end
