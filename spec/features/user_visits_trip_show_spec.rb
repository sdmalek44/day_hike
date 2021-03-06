require 'rails_helper'


describe 'when user visits /trip/:id ' do
  before :each do
    @trip1 = Trip.create!(name: 'blahblah', date: Date.new(2001, 2, 3))
    @trip2 = Trip.create!(name: 'yayayaya', date: Date.new(2001, 2, 3))
    @trail1 = @trip1.trails.create!(length: 100, name: 'bobby', address: '111 tops st')
    @trail2 = @trip1.trails.create!(length: 200, name: 'stopy', address: '333 tops st')
    @trip_trails = TripTrail.create!(trip_id: @trip2.id, trail_id: @trail1.id)

  end
  it 'can see all trails in trip' do
    visit trip_path(@trip1)

    expect(page).to have_content(@trail1.length)
    expect(page).to have_content(@trail1.address)
    expect(page).to have_content(@trail1.name)
    expect(page).to have_content(@trail2.length)
    expect(page).to have_content(@trail2.address)
    expect(page).to have_content(@trail2.name)
    expect(page).to have_content(@trip1.total_hiking_distance)
    expect(page).to have_content(@trip1.average_hiking_distance)
    expect(page).to have_content(@trip1.shortest_hiking_distance)
    expect(page).to have_content(@trip1.longest_hiking_distance)

  end
  it 'can click to go to trail' do
    visit trip_path(@trip1)

    click_link @trail1.name

    expect(current_path).to eq(trail_path(@trail1))
  end
end
