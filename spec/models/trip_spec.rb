require 'rails_helper'


describe Trip, type: :model do
  before :each do
    @trip1 = Trip.create!(name: 'blahblah', date: Date.new(2001, 2, 3))
    @trip2 = Trip.create!(name: 'yayayaya', date: Date.new(2001, 2, 3))
    @trail1 = @trip1.trails.create!(length: 100, name: 'bobby', address: '111 tops st')
    @trail2 = @trip1.trails.create!(length: 200, name: 'stopy', address: '333 tops st')
  end
  it 'can get total hiking distance' do
    expect(@trip1.total_hiking_distance).to eq(300)
  end
end
