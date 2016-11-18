require 'test_helper'

describe Visit do
  let(:visit) { visits(:visit) }

  it 'must have a valid fixture' do
    visit.must_be :valid?
  end
end
