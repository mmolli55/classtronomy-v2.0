class AddDetailsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :possible_answer1, :string
    add_column :questions, :possible_answer2, :string
    add_column :questions, :possible_answer3, :string
    add_column :questions, :possible_answer4, :string
    add_column :questions, :correct_answer, :string
  end
end
