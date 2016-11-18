# A non-db model that helps connect Visits to the Schedule
class Shift
  include ActiveModel::Model

  attr_accessor :start_time, :end_time, :schedule, :client, :visit

  def init(start_time, end_time, schedule)
    @start_time = start_time
    @end_time = end_time
    @schedule = schedule
    @client = schedule.client
    @visit = client.visits.find_by(start_time: start_time, end_time: end_time)
  end

  def planned?
    @visit.present?
  end
end
