class AddExpiryToStoreCredit < ActiveRecord::Migration

  def up
    add_column :spree_store_credits, :expires_at, :datetime
  end

  def down
    remove_column :spree_store_credits, :expires_at
  end

end
