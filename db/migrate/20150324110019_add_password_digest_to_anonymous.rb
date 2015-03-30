class AddPasswordDigestToAnonymous < ActiveRecord::Migration
  def change
		add_column	:anonymous,	:password_digest, :string
  end
end
