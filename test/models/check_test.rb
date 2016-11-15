require 'test_helper'

describe Check do
  let(:check) { checks(:check) }

  it 'must have a valid fixture' do
    check.must_be :valid?
  end
end
