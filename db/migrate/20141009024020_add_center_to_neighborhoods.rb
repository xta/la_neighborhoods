class AddCenterToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :center_lat, :string
    add_column :neighborhoods, :center_lng, :string
  end
end
