require 'sinatra/activerecord'

class CreateThoughtworker < ActiveRecord::Migration
  def up
  	create_table :thoughtworkers do |t|
  	t.string :employeeId
		t.string :gender
		t.string :role
		t.string :grade
		t.decimal :twExperience
		t.string :homeOffice
		t.string :workingOffice
  	end
  end

  def down
  	drop_table :thoughtworkers
  end
end
