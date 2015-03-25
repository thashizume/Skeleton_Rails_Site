class AddPasswordDigestToAnonymous < ActiveRecord::Migration
  def change
		add_column	:Anonymous,	:password_digest, :string
  end
end
