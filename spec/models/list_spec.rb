require 'rails_helper'

describe 'List' do
	
	subject(:list) {List.create(
					name: 'Doomsday Party',
					created: "Mon Jul 27 2015 15:04:40 GMT-0700 (PDT)",
	)}

	it {is_expected.to respond_to :name}
	it {is_expected.to respond_to :created}
	

end