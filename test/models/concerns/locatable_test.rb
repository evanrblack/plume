require 'test_helper'

# Written as a module to allow inclusion on model tests
module LocatableTest
  extend Minitest::Spec::DSL

  # TODO: figure out how to best use useful methods
  # defined in test_helper when this is used as an
  # included module.

  {
    street_address: '100 Main St.',
    city: 'Townsville'
  }.each do |field, value|
    it "must have a #{field.to_s.humanize(capitalize: false)}" do
      model.send("#{field}=", nil)
      model.validate
      model.errors.keys.must_include field
      model.send("#{field}=", value)
      model.validate
      model.errors.keys.wont_include field
    end
  end

  # TODO: extract common pattern of series of values and expectation
  # to a separate function, still need to work out the TODO above.

  it 'must have a valid zip code' do
    [
      [nil, false],
      ['123', false],
      ['123456', false],
      ['0123', false],
      ['01234', true],
      ['87453', true]
    ].each do |value, expected|
      model.zip_code = value
      model.validate
      model.errors.keys.include?(:zip_code).wont_equal expected
    end
  end

  it 'must have a valid state' do
    [
      [nil, false],
      ['tn', false],
      ['Tennessee', false],
      ['XZ', false],
      ['TN', true],
      ['AR', true]
    ].each do |value, expected|
      model.state = value
      model.validate
      model.errors.keys.include?(:state).wont_equal expected
    end
  end

  it 'must retrieve coords on save' do
    # make sure we will change something
    model.latitude = 0
    model.longitude = 0

    # make sure address_changed? == true
    model.street_address = '4 S. College Ave.'

    model.save

    # we should be near / in Fayetteville
    model.latitude.must_be_close_to(36, 1.0)
    model.longitude.must_be_close_to(-94, 1.0)
  end
end
