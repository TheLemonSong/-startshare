class AddMessageToApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :cover_message, :text
  end
end
