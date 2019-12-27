class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string      :name, null: false
      t.string      :last_name, null: false
      t.string      :email, null: false
      t.string      :password, null: false
      t.date        :birthday, null: false
      t.text        :bio
      t.jsonb       :likes, null: false, default: '[]'
      t.jsonb       :dislikes, null: false, default: '[]'
      t.jsonb       :games, null: false, default: '[]'
      t.jsonb       :skills, null: false, default: '[]'
      t.timestamps
    end

    add_index  :users, :email
  end
end
