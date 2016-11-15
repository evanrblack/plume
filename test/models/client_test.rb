require 'test_helper'

describe Client do
  include BirthdatableTest, GenderableTest, GroupableTest,
          LocatableTest, NameableTest, PhonableTest, TaggableTest

  let(:client) { clients(:client) }
  let(:model) { client }

  it 'must have a valid fixture' do
    client.must_be :valid?
  end

  [Contact, Task].each do |klass|
    it "must destroy #{klass.model_name.plural} on destruction" do
      ids = klass.where(client: client).map(&:id)
      ids.wont_be_empty
      client.destroy
      ids.each do |id|
        assert_raise ActiveRecord::RecordNotFound do
          klass.find(id)
        end
      end
    end
  end
end
