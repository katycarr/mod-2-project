require_relative "../../config/environment"

describe User do

  before(:each) do
    @user = User.new(name:"Raichu", password:"Ash", dob:Date.today)
  end

  it 'can be created' do
    expect(@user).to be_valid
  end

end
