class AddChannelNameToSessions < ActiveRecord::Migration[5.2]
	def change
		add_column :sessions, :channel_name, :string
  end
end
