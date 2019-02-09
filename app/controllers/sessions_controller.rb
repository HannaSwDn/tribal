class SessionsController < ApplicationController
    layout "application"

	def show
		if user_signed_in?
			user = current_user
		end
		session = Session.find(params[:id])
		price = SessionPriceService.get_price(session)
		channel_name = session.channel_name
		@session_props = {session: session,coach: session.users.coach,
											members:session.users.trainee, user: user, price: price,
											channel_name: channel_name}
    end

		def create
        pt = PriceTable.find_by(price_point: session_params[:price_point])
        @session = Session.new(session_params.except(:price_point).merge(price_table_id: pt.id))
        @session.save
				if @session.persisted?
					@session.set_channel_name
					@session.save
					@session.users << current_user
            redirect_to root_path
        else
            render json: {errors: 'Every field needs to be filled in!'}
        end
    end

    private

    def session_params
			params.require(:session).permit(:title, :start_date, :price_point)
		end


end
