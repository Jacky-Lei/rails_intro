class RemoveUniqueVisitIndex < ActiveRecord::Migration
  def change
    remove_index(:visits, column: :shortened_url_id)
  end
end
