class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :invoice_type
      t.string 'serial', :limit => 10, :null => false
      t.integer 'number', :null => false
      t.date 'invoice_date', :null => false
      t.float 'invoice_amount', :null => false
      t.timestamps
    end
    add_index('invoices', 'invoice_type_id')
  end
end
