class AddTokenToAnonymous < ActiveRecord::Migration
  def change
		add_column	:anonymous, :token, :string

  end
end
