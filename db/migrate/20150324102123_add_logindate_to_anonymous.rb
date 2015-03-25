class AddLogindateToAnonymous < ActiveRecord::Migration
  def change
		add_column :anonymous, :last_login, :date

  end
end
