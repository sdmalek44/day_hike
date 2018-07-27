require 'rails_helper'


describe 'when user visits /trip/:id ' do
  before :each do
    @trip1 = Trip.create!(name: 'blahblah', date: Date.new(2001, 2, 3))
    @trip2 = Trip.create!(name: 'yayayaya', date: Date.new(2001, 2, 3))
    @trail1 = @trip1.trails.create!(length: 100, name: 'bobby', address: '111 tops st')
    @trail2 = @trip1.trails.create!(length: 200, name: 'stopy', address: '333 tops st')
  end
  it 'can see all trails in trip' do
    visit trip_path(@trip1)

    expect(page).to have_content(@trail1.length)
    expect(page).to have_content(@trail1.address)
    expect(page).to have_content(@trail1.name)
    expect(page).to have_content(@trail2.length)
    expect(page).to have_content(@trail2.address)
    expect(page).to have_content(@trail2.name)
  end
end
