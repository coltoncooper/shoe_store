class Shoe < ApplicationRecord
	belongs_to :buyer, class_name: "User", required: false
	belongs_to :seller, class_name: "User"

	validates :name, presence: true, length: {in: 2..100}
	validates :amount, presence: true, numericality: {greater_than: 0}
	
end
