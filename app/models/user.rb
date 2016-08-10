class User < ActiveRecord::Base
	validates :username, :password, presence: true
	#check to see if user already exists
end
