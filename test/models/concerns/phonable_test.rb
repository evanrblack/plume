require 'test_helper'

# Written as a module to allow inclusion on model tests
module PhonableTest
  extend Minitest::Spec::DSL

  it 'must normalize the phone number' do
    model.phone_number = '(931) 555 0677'
    model.save
    model.phone_number.must_equal '+19315550677'
    model.phone_number = '931.555.0677'
    model.save
    model.phone_number.must_equal '+19315550677'
  end

  it 'must reject invalid phone numbers' do
    [
      nil,
      '1234',
      '555-0677',
      '931.22.462'
    ].each do |number|
      model.phone_number = number
      model.validate
      model.errors.keys.must_include :phone_number
    end
  end

  it 'must have human parsable formatting' do
    model.phone_number = '+19315550677'
    model.save
    model.phone_number_formatted.must_equal '(931) 555-0677'
  end
end
