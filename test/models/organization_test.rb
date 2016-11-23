require 'test_helper'

describe Organization do
  include EmailableTest, OrganizableTest, LocatableTest, PhonableTest

  let(:organization) { organizations(:organization) }
  let(:model) { organization }

  it 'have a valid fixture' do
    organization.must_be :valid?
  end

  [Manager, Caregiver, Client].each do |klass|
    it "must destroy #{klass.model_name.plural} on destruction" do
      ids = klass.where(organization: organization).map(&:id)
      ids.wont_be_empty
      organization.destroy
      ids.each do |id|
        assert_raise ActiveRecord::RecordNotFound do
          klass.find(id)
        end
      end
    end
  end
end
