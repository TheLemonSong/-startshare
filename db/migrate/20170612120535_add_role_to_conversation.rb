class AddRoleToConversation < ActiveRecord::Migration[5.0]
  def change
    remove_column :applications, :cover_message
  end
end
