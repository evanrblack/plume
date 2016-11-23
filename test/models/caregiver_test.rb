require 'test_helper'

describe Caregiver do
  include BirthdatableTest, EmailableTest, GenderableTest,
          OrganizableTest, LocatableTest, LoginableTest,
          NameableTest, PhonableTest, TaggableTest

  let(:caregiver) { caregivers(:caregiver) }
  let(:model) { caregiver }
  let(:ability) { Ability.new(caregiver) }

  it 'must have a valid fixture' do
    caregiver.must_be :valid?
  end

  # Ability testing
  it 'can read itself' do
    assert ability.can?(:read, caregiver)
    assert ability.cannot?(:read, Caregiver.new)
  end

  it 'can update itself' do
    assert ability.can?(:update, caregiver)
    assert ability.cannot?(:update, Caregiver.new)
  end
end
