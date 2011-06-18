require 'rubygems'

ENV["RAILS_ENV"] ||= "test"

require 'bundler'
require 'test/unit'
require 'active_record'
require "#{File.dirname(__FILE__)}/../lib/hashed_attributes"


ActiveRecord::Schema.verbose = false
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

def setup_database
  ActiveRecord::Schema.define(:version => 1) do
    create_table :people do |t|
      t.string :name
      t.text :preferences
    end
  end
end

def teardown_database
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end

class Person < ActiveRecord::Base
  hashed_attributes :preferences, :theme, :plan, :favorite_color
end
