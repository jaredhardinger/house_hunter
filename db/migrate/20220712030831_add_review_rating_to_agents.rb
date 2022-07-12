class AddReviewRatingToAgents < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :review_rating, :float
  end
end
