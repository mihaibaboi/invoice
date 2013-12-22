class CreateInvoiceTypes < ActiveRecord::Migration
  def change
    create_table :invoice_types do |t|
      t.string 'code', :limit => 3, :null => false
      t.string 'name', :limit => 25, :null => false
    end
  end
end
