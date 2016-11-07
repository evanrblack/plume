require 'test_helper'

module EmailableTest
  extend Minitest::Spec::DSL

  it 'must have a valid email' do
    [
      [nil, false],
      ['mayonnaise', false],
      ['someone@', false],
      ['anotherperson@gmail.com', true],
      ['andyetanother@hotmail.com', true]
    ].each do |value, expected|
      model.email = value
      model.validate
      model.errors.keys.include?(:email).wont_equal expected
    end
  end
end
