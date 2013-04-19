class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # In a real application we'd use something like Devise or rolling your
      # own authentication as well as creating fields for encrypted passwords,
      # salts and so on. For the purposes of this demo we're just going to
      # create email and preference fields (latter to follow)
      t.string        :email
      t.hstore        :preferences
      t.timestamps
    end
  end
end
