require 'test_helper'

describe Schedule do
  let(:caregiver_schedule) { schedules(:caregiver_schedule) }
  let(:client_schedule) { schedules(:client_schedule) }
  let(:schedule) { schedules(:caregiver_schedule) }

  it 'must have a valid fixture' do
    schedule.must_be :valid?
  end

  # This does not account for wraparound yet
  it 'must correctly give time ranges' do
    bow = (Time.zone.now + 7.days).beginning_of_week
    caregiver_schedule.shifts_dt.first.must_equal(bow..(bow + 1.day))
  end
end
