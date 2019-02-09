class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  enum role: { trainee: 0, coach: 1 }

	validates_presence_of :first_name, :last_name, :role

	has_many :transactions
	has_and_belongs_to_many :sessions

	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

	def self.from_omniauth(auth, params)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.email = auth.info.email
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			if params.present?
				user.role = params['role']
			end
      user.password = Devise.friendly_token[0,20]
    end
  end

end
