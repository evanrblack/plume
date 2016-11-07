require 'test_helper'

describe Caregiver do
  include BirthdatableTest, EmailableTest, GenderableTest,
          GroupableTest, LocatableTest, NameableTest,
          PhonableTest

  let(:caregiver) { caregivers(:caregiver) }
  let(:model) { caregiver }

  it 'must have a valid fixture' do
    caregiver.must_be :valid?
  end
end