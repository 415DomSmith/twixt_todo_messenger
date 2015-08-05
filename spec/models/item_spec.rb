require 'rails_helper'

describe 'Item' do
	subject(:item) {Item.create(
									name: "Buy ice",
									created: "Mon Jul 27 2015 15:04:40 GMT-0700 (PDT)",
									priority: "high",
									image_url: "http://www.stewartspackaging.com/ProductImages/Icedraw.jpg",
									complete: false,
									list_id: 2
		)}

	it { is_expected.to respond_to :name}
	it { is_expected.to respond_to :created}
	it { is_expected.to respond_to :priority}
	it { is_expected.to respond_to :image_url}
	it { is_expected.to respond_to :complete}
	it { is_expected.to respond_to :list_id}
	
end

