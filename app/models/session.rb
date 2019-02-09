class Session < ApplicationRecord
	validates_presence_of :title, :start_date
	belongs_to :price_table
	has_many :transactions
	has_and_belongs_to_many :users
	enum status: { scheduled: 0, confirmed: 1, full: 2 }

	def set_channel_name
		self.channel_name = self.title + "_Channel_" + self.id.to_s
	end
end
