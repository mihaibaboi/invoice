class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.references :entity_type
      t.string 'name', :null => false
      t.string 'registration_number', :null => false
      t.string 'commercial_registration'
      t.string 'bank_name', :null => false
      t.string 'bank_account', :limit => 24, :null => false
      t.string 'address_line', :null => false
      t.timestamps
    end
    add_index('entities', 'entity_type_id')
  end
end
