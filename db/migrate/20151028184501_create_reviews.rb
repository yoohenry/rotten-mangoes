class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :movie, index: true
      t.text :text
      t.string :rating_out_of_ten
      t.string :integer

      t.timestamps
    end
  end
end
