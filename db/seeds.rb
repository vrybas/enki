# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(:username => "Test user", :firstname => "Test", :lastname => "user", :email => "sample@example.com", :password => "123456")
