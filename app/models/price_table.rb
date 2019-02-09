class PriceTable < ApplicationRecord
		validates_presence_of :price_point, :trainee_1, :trainee_3,
		:trainee_4, :trainee_5, :trainee_6, :trainee_7, :trainee_8
    has_many :sessions
    enum price_point: { low: 0, medium: 1, high: 2 }
end
