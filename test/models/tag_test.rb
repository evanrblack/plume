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
end
