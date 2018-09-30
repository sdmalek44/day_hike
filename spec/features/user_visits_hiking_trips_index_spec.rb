require 'rails_helper'


describe 'when user visits /trips ' do
  before :each do
    @trip1 = Trip.create!(name: 'blahblah', date: Date.new(2001, 2, 3))
    @trip2 = Trip.create!(name: 'yayayaya', date: Date.new(2001, 2, 3))
  end
  it 'sees a list of trips' do

    visit trips_path

    expect(page).to have_content(@trip1.name)
    expect(page).to have_content(@trip2.name)
  end
  it 'can click on trip name to trip show' do
    visit trips_path

    click_on @trip1.name

    expect(current_path).to eq(trip_path(@trip1))
  end
end
