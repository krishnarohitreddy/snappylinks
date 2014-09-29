class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
    	t.string :name
<<<<<<< HEAD
    	t.string :email
    	t.string :message
=======
>>>>>>> 22e25484e623958da83532dd583cf6cdd91cca3e

      t.timestamps
    end
  end
end
