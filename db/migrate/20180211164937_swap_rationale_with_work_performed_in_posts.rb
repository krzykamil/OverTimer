class Swapwork_performedWithWorkPerformedInPosts < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :work_performed, :work_performed
  end
end
