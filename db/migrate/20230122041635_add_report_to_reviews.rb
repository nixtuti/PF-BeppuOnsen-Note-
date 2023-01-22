class AddReportToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :report, :boolean, default: false, null: false
  end
end
