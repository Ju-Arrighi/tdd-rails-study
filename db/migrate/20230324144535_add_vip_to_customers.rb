class AddVipToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :vip, :boolean
  end
end
