class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.text :response
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
