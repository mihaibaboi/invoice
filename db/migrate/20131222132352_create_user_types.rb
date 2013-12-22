class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string 'code', :limit => 3, :null => false
      t.string 'name', :limit => 10, :null => false
      t.timestamps
    end
  end
end
