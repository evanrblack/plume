require 'test_helper'

module GroupableTest
  extend Minitest::Spec::DSL

  it 'must have a valid group' do
    [
      [nil, true],
      [Group.new, true]
    ].each do |value, expected|
      model.group = value
      model.validate
      model.errors.keys.include?(:group).wont_equal expected
    end
  end
end
