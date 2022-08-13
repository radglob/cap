require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: 'me@example.org', password: 'password1234')
    @user.create_basic_info(first_name: 'John', last_name: 'Doe', birthdate: Date.new(1990, 1, 1))
  end

  after do
    User.delete_all
  end

  context '#full_name' do
    it 'returns "Stranger" for users without a first and last name' do
      u = User.new
      expect(u.full_name).to eq 'Stranger'
    end

    it 'returns the first and last name concatenated with a space' do
      expect(@user.full_name).to eq 'John Doe'
    end
  end

  context '#age' do
    it "returns the user's age in years" do
      expect(@user.age).to eq 32
    end
  end
end
