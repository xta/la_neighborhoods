class AddPolygonToNeighborhoods < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :polygon, :text
  end
end
