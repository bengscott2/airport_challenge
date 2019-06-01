require 'airport.rb'

describe Airport do
  it 'plane can land and get stored in hanger' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.hanger).to include(plane)
  end

  it 'take off plane from airport and confirm plane is not in hanger' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weather) { "sunny" }
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.hanger).not_to include(plane)
  end

  context 'when weather is stormy' do

    it 'raises error if trying to take off' do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:weather) { "stormy" }
      expect { airport.takeoff(plane) }.to raise_error("Can't take off because it's stormy")
    end

  end

end
