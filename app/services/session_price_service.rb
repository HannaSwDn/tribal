class SessionPriceService
	def self.get_price(session)
		count = session.users.trainee.count
		price_row = PriceTable.find_by_id(session.price_table_id)
		SessionPriceService.calculate_price(count, price_row)
	end

	private

	def self.calculate_price(count, price_row)
		trainee_list = ['trainee_1','trainee_2','trainee_3', 'trainee_4', 'trainee_5', 'trainee_6', 'trainee_7', 'trainee_8']
		trainee_count = trainee_list[count]
		price_row[trainee_count]
	end
end
