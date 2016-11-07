require 'test_helper'

describe Manager do
  include EmailableTest, GroupableTest, LoginableTest,
          NameableTest, PhonableTest

  let(:manager) { managers(:manager) }
  let(:model) { manager }

  it 'must have a valid fixture' do
    manager.must_be :valid?
  end
end
