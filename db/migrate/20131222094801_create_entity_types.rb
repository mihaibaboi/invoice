class CreateEntityTypes < ActiveRecord::Migration
  def change
    create_table :entity_types do |t|
      t.string 'code', :limit => 3, :null => false
      t.string 'name', :limit => 20, :null => false
    end
  end
end
