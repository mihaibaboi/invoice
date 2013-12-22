class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.references :invoice
      t.string 'serial', :limit => 10, :null => false
      t.integer 'number', :null => false
      t.date 'receipt_date', :null => false
      t.string 'payer_name', :null => false
      t.string 'registration_number'
      t.string 'address_line'
      t.float 'amount', :null => false
      t.string 'representing'
      t.timestamps
    end
    add_index('receipts', 'invoice_id')
  end
end
