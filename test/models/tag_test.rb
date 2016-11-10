require 'test_helper'

describe Tag do
  let(:tag) { tags(:health_tag) }

  it 'must have a valid fixture' do
    tag.must_be :valid?
  end

  # Relies on fixtures being set up.
  it 'must have caregivers and clients' do
    tag.clients.wont_be :empty?
    tag.clients.wont_be :empty?
  end

  it 'must destroy tag joins on destruction' do
    ids = TagJoin.where(tag: tag).map(&:id)
    ids.wont_be_empty
    tag.destroy
    ids.each do |id|
      assert_raise ActiveRecord::RecordNotFound do
        TagJoin.find(id)
      end
    end
  end

  it 'wont destroy taggables on destruction' do
    ids = tag.clients.map(&:id)
    tag.destroy
    ids.each do |id|
      assert_nothing_raised do
        Client.find(id)
      end
    end
  end
end
