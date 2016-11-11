require 'test_helper'

describe Shift do
  let(:shift) { shifts(:shift) }

  it 'must have a valid fixture' do
    shift.must_be :valid?
  end

  it 'must prevent nonsensical dates' do
    shift.start_date = Time.zone.today
    shift.end_date = Time.zone.today - 1.day
    shift.validate
    shift.errors.keys.must_include :end_date
  end

  it 'must align start and end dates based on day' do
    shift.day = 'tuesday'
    shift.start_date = Date.new(2016, 11, 4) # Friday
    shift.end_date = Date.new(2016, 11, 9) # Wednesday
    shift.save
    shift.start_date.must_equal Date.new(2016, 11, 8)
    shift.start_date.must_equal Date.new(2016, 11, 8)
    shift.start_date = Date.new(2016, 10, 27) # Thursday
    shift.end_date = Date.new(2016, 11, 15) # Tuesday
    shift.save
    shift.start_date.must_equal Date.new(2016, 11, 1)
    shift.end_date.must_equal Date.new(2016, 11, 15)
  end
end
