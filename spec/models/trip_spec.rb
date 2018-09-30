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
  it 'can get average_hiking_distance' do
    expect(@trip1.average_hiking_distance).to eq(150)
  end
  it 'can get shortest hiking distance' do
    expect(@trip1.shortest_hiking_distance).to eq(100)
  end
  it 'can get longest hiking distance' do
      expect(@trip1.longest_hiking_distance).to eq(200)
  end
end
