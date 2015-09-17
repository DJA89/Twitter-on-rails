class RenameEncrPassAsPassDig < ActiveRecord::Migration
    def self.up
      rename_column :users, :encrypted_password, :password_digest
    end

    def self.down
      rename_column :users, :password_digest, :encrypted_password
    end
end
