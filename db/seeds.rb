Transaction.destroy_all
Session.destroy_all
PriceTable.destroy_all
User.destroy_all

8.times do
	FactoryBot.create(:user)
end
coach = User.create(first_name: 'Jack', last_name: 'Coach', email: 'coach@mail.com', password: 'password', role: 1)

low = PriceTable.create(price_point: 0, trainee_1: 20,trainee_2: 20, trainee_3: 7, trainee_4: 6, trainee_5: 5, trainee_6: 4.5, trainee_7: 4, trainee_8: 3.5)
medium = PriceTable.create(price_point: 1, trainee_1: 25,trainee_2: 25, trainee_3: 9, trainee_4: 7, trainee_5: 6, trainee_6: 5, trainee_7: 4.5, trainee_8: 4)
high = PriceTable.create(price_point: 2, trainee_1: 30,trainee_2: 30, trainee_3: 10, trainee_4: 8, trainee_5: 7, trainee_6: 6, trainee_7: 5.5, trainee_8: 5)


3.times do
    session = Session.create(title: 'Crossfit', start_date: '2019-02-01 15:00:00', status: 0, price_table_id: low.id)
		session.set_channel_name
		session.save
	end

3.times do
		session = Session.create(title: 'Body Pump', start_date: '2019-02-01 15:00:00', status: 1, price_table_id: medium.id)
		session.set_channel_name
		session.save
end

3.times do
		session = Session.create(title: 'Yoga', start_date: '2019-02-01 15:00:00', status: 2, price_table_id: high.id)
		session.set_channel_name
		session.save
end

sessions = Session.all

sessions.each do |session|
		session.users << coach
end
