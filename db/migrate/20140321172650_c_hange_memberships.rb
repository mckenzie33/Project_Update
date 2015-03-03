class CHangeMemberships < ActiveRecord::Migration
  def change
	change_table :memberships do |t|
		t.boolean :is_confirmed
	end
  end
end

