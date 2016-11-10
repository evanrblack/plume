require 'test_helper'

describe Client do
  include BirthdatableTest, GenderableTest, GroupableTest,
          LocatableTest, NameableTest, PhonableTest, TaggableTest

  let(:client) { clients(:client) }
  let(:model) { client }

  it 'must have a valid fixture' do
    client.must_be :valid?
  end

  it 'must destroy contacts on destruction' do
    ids = client.contacts.map(&:id)
    ids.wont_be_empty
    client.destroy
    ids.each do |id|
      assert_raise ActiveRecord::RecordNotFound do
        Contact.find(id)
      end
    end
  end

  it 'must destroy shifts on destruction' do
    ids = client.shifts.map(&:id)
    ids.wont_be_empty
    client.destroy
    ids.each do |id|
      assert_raise ActiveRecord::RecordNotFound do
        Shift.find(id)
      end
    end
  end
end
