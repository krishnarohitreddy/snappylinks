class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
    	t.string :name
    	t.string :email
    	t.string :message
        t.timestamps
    end
end
