class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |u|
      u.string      :name, null: false
      u.string      :last_name, null: false
      u.string      :email, null: false
      u.string      :password_digest, null: false
      u.date        :birthday, null: false
      u.text        :bio
      u.jsonb       :likes, null: false, default: '[]'
      u.jsonb       :dislikes, null: false, default: '[]'
      u.jsonb       :games, null: false, default: '[]'
      u.jsonb       :skills, null: false, default: '[]'
      u.decimal      :latitude, {:precision=>10, :scale=>6}
      u.decimal      :longitude, {:precision=>10, :scale=>6}
      u.timestamps
    end

    add_index  :users, :email
  end
end
