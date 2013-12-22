class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :user_type, :default => 2
      t.string 'username', :limit => 25, :null => false
      t.string 'email', :limit => 50, :null => false
      t.string 'hashed_password', :limit => 40, :null => false # 40 characters in a SHA-1 string
      t.string 'first_name', :limit => 100
      t.string 'last_name', :limit => 50
      t.timestamps
    end
    add_index('users', 'user_type_id')
  end
end
