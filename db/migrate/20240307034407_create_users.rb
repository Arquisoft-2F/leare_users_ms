class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: false do |t|
      t.string :id, limit: 36, primary_key: true, null: false
      t.string :nickname
      t.string :name
      t.string :lastname
      t.string :picture_id
      t.string :nationality
      t.string :email
      t.string :web_site
      t.text :biography
      t.string :twitter_link
      t.string :linkedin_link
      t.string :facebook_link

      t.timestamps
    end
  end
end
