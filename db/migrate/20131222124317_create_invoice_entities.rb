class CreateInvoiceEntities < ActiveRecord::Migration
  def change
    create_table :invoice_entities do |t|
      t.references :entity
      t.references :invoice
      t.references :invoice_entity_type
      t.timestamps
    end
    add_index('invoice_entities', 'entity_id')
    add_index('invoice_entities', 'invoice_id')
    add_index('invoice_entities', 'invoice_entity_type_id')
  end
end
