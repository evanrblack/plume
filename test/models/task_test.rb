require 'test_helper'

describe Task do
  let(:task) { tasks(:task) }

  it 'must have a valid fixture' do
    task.must_be :valid?
  end
end
