class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.references :invoice
      t.string 'description', :null => false
      t.string 'measurement_units', :null => false
      t.integer 'number_of_units', :null => false
      t.float 'unit_price', :null => false
      t.float 'total_price', :null => false
      t.timestamps
    end
    add_index('invoice_items', 'invoice_id')
  end
end
