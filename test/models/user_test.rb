require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.create(email: 'me@example.org', password: 'password1234')
    @user.create_basic_info(first_name: 'John', last_name: 'Doe', birthdate: Date.new(1990, 1, 1))
  end

  teardown do
    User.delete_all
  end

  test 'user has full name' do
    assert @user.full_name == 'John Doe'
  end

  test "user without name returns 'Stranger' for full name" do
    assert User.new.full_name == 'Stranger'
  end

  test 'user age is calculated correctly' do
    Timecop.freeze(Date.new(2022, 8, 8)) do
      assert @user.age == 32
    end
  end
end
