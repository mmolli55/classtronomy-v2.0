class AddUserIdToScores < ActiveRecord::Migration
  def change
    add_column :scores, :user_id, :integer
    add_column :scores, :course_id, :integer
  end
end
