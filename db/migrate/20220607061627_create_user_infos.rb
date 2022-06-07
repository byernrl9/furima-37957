class CreateUserInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_infos do |t|
      t.string :family_name,        null: false
      t.string :first_name,         null: false
      t.string :family_name_kana,   null: false
      t.string :first_name_kana,    null: false
      t.date   :birth_day,          null: false 
      t.references :user, foreign_key: true, null: false 
      t.timestamps
    end
  end
end
