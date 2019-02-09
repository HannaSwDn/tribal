require 'stripe'

class CreditCardService

	def self.create_stripe_customer(current_user,params)
		Stripe::Customer.create(
			email: current_user.email,
			source: get_token(params),
			description: [current_user.first_name, current_user.last_name].join(' ')
		)
	end

	def self.create_charge (customer,current_user,session)
		price = SessionPriceService.get_price(session)
		Stripe::Charge.create(
			customer: customer.id,
			amount: price * 100,
			currency: 'SEK',
			capture: false,
			description: "#{current_user.first_name} #{current_user.last_name}
										purchased the session: #{session.title}"
		)
	end

	def self.capture(transaction, session)
		CreditCardService.capture_charge(transaction, session)
	end

	def self.get_token(params)
		Rails.env.test? ? generate_test_token : params['stripeToken']
	end

	def self.generate_test_token
		StripeMock.create_test_helper.generate_card_token
	end

	private

	def self.capture_charge(transaction, session)
		unless session.users.trainee.count === 2
			charge = Stripe::Charge.retrieve(transaction.stripe_id)
			price = SessionPriceService.get_price(session)
			charge.capture(amount: price * 100)
			CreditCardService.update_transaction(transaction,price)
		end


	end

	def self.update_transaction(transaction,price)
		transaction.update_attribute(:payment_status, true)
		transaction.update_attribute(:amount, price)
	end


end
