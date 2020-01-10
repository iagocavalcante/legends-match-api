class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.0]
  def change
    
    create_table(:users) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string      :image
      t.string      :email
      t.string      :full_name, null: false
      t.string      :nickname, null: false
      t.date        :birthday, null: false
      t.text        :bio
      t.jsonb       :likes, null: false, default: []
      t.jsonb       :dislikes, null: false, default: []
      t.jsonb       :games, null: false, default: {}
      t.jsonb       :skills, null: false, default: {}
      t.jsonb       :preferences, null: false, default: {}
      t.decimal     :latitude, precision: 10, scale: 6
      t.decimal     :longitude, precision: 10, scale: 6

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, [:uid, :provider],     unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,       unique: true
  end
end
