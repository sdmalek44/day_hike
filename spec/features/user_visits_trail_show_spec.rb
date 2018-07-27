require 'rails_helper'


describe 'user visits trail show' do
  before :each do
    @trip1 = Trip.create!(name: 'blahblah', date: Date.new(2001, 2, 3))
    @trail1 = @trip1.trails.create!(length: 100, name: 'bobby', address: '111 tops st')
    @trail2 = @trip1.trails.create!(length: 200, name: 'stopy', address: '333 tops st')
    @trip2 = Trip.create!(name: 'yayayaya', date: Date.new(2001, 2, 3))
    @trip_trails = TripTrail.create!(trip_id: @trip2.id, trail_id: @trail1.id)
  end
  it 'can see all attributes' do
    visit trail_path(@trail1)
    expect(page).to have_content(@trail1.length)
    expect(page).to have_content(@trail1.address)
    expect(page).to have_content(@trail1.name)
    expect(page).to have_content(@trail1.calc_trips)
  end
end
