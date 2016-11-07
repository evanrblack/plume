require 'test_helper'

describe Group do
  include EmailableTest, GroupableTest, LocatableTest, PhonableTest

  let(:group) { groups(:group) }
  let(:model) { group }

  it 'have a valid fixture' do
    group.must_be :valid?
  end
end
