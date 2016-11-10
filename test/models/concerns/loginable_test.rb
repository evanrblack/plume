require 'test_helper'

module LoginableTest
  extend Minitest::Spec::DSL
  # Invalid logins give errors

  it 'must destroy login on destruction' do
    login = model.login
    model.destroy
    assert_raise ActiveRecord::RecordNotFound do
      Login.find(login.id)
    end
  end
end
