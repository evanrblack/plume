require 'test_helper'

describe Client do
  include BirthdatableTest, GenderableTest, GroupableTest,
          LocatableTest, NameableTest, PhonableTest

  let(:client) { clients(:client) }
  let(:model) { client }

  it 'must have a valid fixture' do
    client.must_be :valid?
  end
end
