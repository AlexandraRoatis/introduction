class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.references :story, foreign_key: true
      t.references :user, foreign_key: true
      t.references :author

      t.timestamps
    end
  end
end
