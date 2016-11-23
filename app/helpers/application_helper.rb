# The helper module is accessible from every view.
module ApplicationHelper
  def current_user
    current_login.loginable if current_login
  end

  def navbar_links
    links = []
    if current_user
      links << ['Dashboard', root_path]
      links << ['Sign out', destroy_login_session_path, :delete]
    else
      links << ['Home', root_path]
      links << ['Sign in', new_login_session_path]
    end
  end

  def quick_look(figure, unit, path, type = 'info')
    render partial: 'shared/quick_look', locals: {
      figure: figure,
      unit: unit,
      path: path,
      type: type
    }
  end

  def strftime_format(type)
    {
      short: '%-I:%M %p',
      medium: '%a %-I:%M %p',
      long: '%a, %b %e, %-I:%M %p'
    }[type]
  end

  def pretty_time(time)
    return pretty_time_range(time) if time.class == Range
    time.strftime(strftime_format(:long))
  end

  def pretty_time_range(range)
    start_time = range.min.strftime(strftime_format(:long))
    end_format = case range.max - range.min
                 when 0...1.day
                   range.max.day == range.min.day ? :short : :medium
                 when 1.day...1.week then :medium
                 else :long
                 end
    end_time = range.max.strftime(strftime_format(end_format))
    "#{start_time} to #{end_time}"
  end
end
