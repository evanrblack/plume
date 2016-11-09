require 'test_helper'

describe Manager do
  include EmailableTest, GroupableTest, LoginableTest,
          NameableTest, PhonableTest

  let(:manager) { managers(:manager) }
  let(:model) { manager }
  let(:ability) { Ability.new(manager) }

  let(:group) { manager.group }

  it 'must have a valid fixture' do
    manager.must_be :valid?
  end

  # Ability testing
  [Client, Caregiver].each do |klass|
    [:create, :read, :update, :destroy].each do |action|
      it "can #{action} #{klass.model_name.plural} only if in same group" do
        assert ability.can?(action, klass.new(group: group))
        assert ability.cannot?(:create, klass.new)
      end
    end
  end
end
