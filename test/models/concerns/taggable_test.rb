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

  it 'must destroy tag joins on destruction' do
    ids = TagJoin.where(taggable: model).map(&:id)
    ids.wont_be_empty
    model.destroy
    ids.each do |id|
      assert_raise ActiveRecord::RecordNotFound do
        TagJoin.find(id)
      end
    end
  end

  it 'wont destroy tags on destruction' do
    ids = model.tags.map(&:id)
    model.destroy
    ids.each do |id|
      assert_nothing_raised do
        Tag.find(id)
      end
    end
  end
end
