require 'test_helper'

describe Task do
  let(:task) { tasks(:task) }

  it 'must have a valid fixture' do
    task.must_be :valid?
  end

  [Check].each do |klass|
    it "must destroy #{klass.model_name.plural} on destruction" do
      ids = klass.where(task: task).map(&:id)
      ids.wont_be_empty
      task.destroy
      ids.each do |id|
        assert_raise ActiveRecord::RecordNotFound do
          klass.find(id)
        end
      end
    end
  end
end
