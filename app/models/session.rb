class Session < ApplicationRecord
	validates_presence_of :title, :start_date
	belongs_to :price_table
	enum status: { available: 0, booked: 1, full: 2 }

	has_many :coaches, :through => :bookings

	has_many :trainees, :through => :bookings
	
	has_many :bookings, :inverse_of => :sessions

	accepts_nested_attributes_for :bookings
end
