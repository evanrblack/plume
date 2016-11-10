require 'test_helper'

describe Shift do
  let(:shift) { shifts(:shift) }

  it 'must have a valid fixture' do
    shift.must_be :valid?
  end
end
