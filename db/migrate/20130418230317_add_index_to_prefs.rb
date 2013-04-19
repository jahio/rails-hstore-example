class AddIndexToPrefs < ActiveRecord::Migration
  def change
    add_hstore_index :users, :preferences, :type => :gist # or :type => :gin
    # Note that :gist is the default. It’s explicitly stated here for
    # educational purposes.
  end
end
