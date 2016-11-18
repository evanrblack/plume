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

  # In this case, just a time range
  def pretty_shift(shift)
    a = shift.min
    b = shift.max
    short = '%-I:%M %p'
    medium = '%a %-I:%M %p'
    long = '%a, %b %e, %-I:%M %p'
    "#{a.strftime(long)} to #{b.strftime(a.day == b.day ? short : medium)}"
  end
end
