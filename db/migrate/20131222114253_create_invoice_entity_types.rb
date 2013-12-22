class CreateInvoiceEntityTypes < ActiveRecord::Migration
  def change
    create_table :invoice_entity_types do |t|
      t.string 'code', :limit => 3, :null => false
      t.string 'name', :null => false
    end
  end
end
