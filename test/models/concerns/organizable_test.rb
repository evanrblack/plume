require 'test_helper'

module OrganizableTest
  extend Minitest::Spec::DSL

  it 'must have a valid organization' do
    [
      [nil, true],
      [Organization.new, true]
    ].each do |value, expected|
      model.organization = value
      model.validate
      model.errors.keys.include?(:organization).wont_equal expected
    end
  end
end
