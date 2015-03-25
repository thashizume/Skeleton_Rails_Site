class CreateAnonymous < ActiveRecord::Migration
  def change
    create_table :anonymous do |t|
      t.string :nickname
      t.string :password

      t.timestamps
    end
  end
end
