require 'rails_helper'


describe 'when user visits /trips ' do
  it 'sees a list of trips' do
    trip1 = Trip.create!(name: 'blahblah', date: Date.new(2001, 2, 3))
    trip2 = Trip.create!(name: 'yayayaya', date: Date.new(2001, 2, 3))

    visit trips_path

    expect(page).to have_content(trip1.name)
    expect(page).to have_content(trip2.name)
  end
end
