require 'test_helper'

describe Group do
  include EmailableTest, GroupableTest, LocatableTest, PhonableTest

  let(:group) { groups(:group) }
  let(:model) { group }

  it 'have a valid fixture' do
    group.must_be :valid?
  end

  [Manager, Caregiver, Client].each do |klass|
    it "must destroy #{klass.model_name.plural} on destruction" do
      ids = klass.where(group: group).map(&:id)
      ids.wont_be_empty
      group.destroy
      ids.each do |id|
        assert_raise ActiveRecord::RecordNotFound do
          klass.find(id)
        end
      end
    end
  end
end
