require 'test_helper'

module BirthdatableTest
  extend Minitest::Spec::DSL

  it 'must have a valid birthdate' do
    [
      [nil, false],
      ['1994-0111-37', false],
      ['1994-01-01', true]
    ].each do |value, expected|
      model.birthdate = value
      model.validate
      model.errors.keys.include?(:birthdate).wont_equal expected
    end
  end
end
