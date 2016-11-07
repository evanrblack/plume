require 'test_helper'

describe Contact do
  include EmailableTest, NameableTest, PhonableTest

  let(:contact) { contacts(:contact) }
  let(:model) { contact }

  it 'must have a valid fixture' do
    contact.must_be :valid?
  end
end
