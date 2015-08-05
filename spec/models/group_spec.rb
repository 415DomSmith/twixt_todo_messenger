require 'rails_helper'

describe 'Group' do
	subject(:group) { Group.create(
										name: "LDR"
		)}
	it { is_expected.to respond_to :name}
end