class AddUserIdToInvoiceTable < ActiveRecord::Migration
  def change
    add_column('invoices', 'user_id', :integer, :null => false, :default => 0)
    add_index('invoices', 'user_id')
  end
end
