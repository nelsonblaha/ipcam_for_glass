class AddCardIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mirror_card_id, :string
  end
end
