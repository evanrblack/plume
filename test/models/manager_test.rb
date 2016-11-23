require 'test_helper'

describe Manager do
  include EmailableTest, OrganizableTest, LoginableTest,
          NameableTest, PhonableTest

  let(:manager) { managers(:manager) }
  let(:model) { manager }
  let(:ability) { Ability.new(manager) }

  let(:organization) { manager.organization }

  it 'must have a valid fixture' do
    manager.must_be :valid?
  end

  # Ability testing
  [Client, Caregiver].each do |klass|
    [:create, :read, :update, :destroy].each do |action|
      it "can #{action} #{klass.model_name.plural} if in same organization" do
        assert ability.can?(action, klass.new(organization: organization))
        assert ability.cannot?(:create, klass.new)
      end
    end
  end
end
