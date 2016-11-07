require 'test_helper'

module TaggableTest
  extend Minitest::Spec::DSL

  # Throws an error out on nil
  it 'must have a valid tag' do
    [
      [Tag.new(name: 'Squeaky Knee', category: :health), true]
    ].each do |value, expected|
      model.tags << value
      model.validate
      model.errors.keys.include?(:tags).wont_equal expected
    end
  end
end
