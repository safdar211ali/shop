class AddStatusToProducts < ActiveRecord::Migration
  def up
    change_column :products, :status, :string,:default => 'Enabled'
  end
  def down
    remove_column :products,:status
  end
end
