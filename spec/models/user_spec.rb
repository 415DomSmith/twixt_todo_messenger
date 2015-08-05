require 'rails_helper'

describe 'User' do
	
	subject(:user) {User.create(
					username: 'rkpuppy',
					email: 'dubbeleozeven@gmail.com',
					first_name: 'Rebecca',
					last_name: 'Kilberg',
					password: 'puppies',
					is_admin: true,
					avatar: 'http://www.artseastny.com/wp-content/uploads/2015/05/3801-1c5045406-tdy-121204-puppy-names-02.jpg'
		)}

	it {is_expected.to respond_to :username}
	it {is_expected.to respond_to :email}
	it {is_expected.to respond_to :first_name}
	it {is_expected.to respond_to :last_name}
	it {is_expected.to respond_to :password}
	it {is_expected.to respond_to :avatar}
	it {is_expected.to respond_to :is_admin}
	it {is_expected.to respond_to :is_owner}
	it {is_expected.to respond_to :birthday}
	# can't test with associations I think
	# it {is_expected.to validate_uniqueness_of(:username).case_insensitive}


end