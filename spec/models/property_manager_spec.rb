require_relative "../../config/environment"

describe PropertyManager do

  before(:each) do
    @propertymanager = PropertyManager.create(name:"Pikachu")
  end

  it 'can be created' do
    expect(@propertymanager).to be_valid
  end

  it 'can own buildings' do
    expect(@propertymanager.buildings).to eq([])
  end

  it 'can create buildings' do
    @building = @propertymanager.buildings.build(address:"11 Broadway", borough:"Bronx")
    expect(@building.property_manager).to eq(@propertymanager)
  end

  it 'can have many leases' do
    @building = Building.find_or_create_by(address:"11 Broadway", borough:"Manhattan", property_manager_id:@propertymanager.id)
    @user = User.find_or_create_by(name:"Meowth", dob:Date.today)
    @lease = Lease.find_or_create_by(user_id:@user.id, building_id:@building.id, rent:1000, current:true)
    @lease_two = Lease.find_or_create_by(user_id:@user.id, building_id:@building.id, rent:1500, current:false)
    expect(@propertymanager.leases.size).to eq(2)
  end

end
