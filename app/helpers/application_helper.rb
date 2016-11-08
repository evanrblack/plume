# The helper module accessible from every view and controller.
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

  def quick_look(figure, unit, path, icon='star', type='info')
    render partial: 'shared/quick_look', locals: {
      figure: figure,
      unit: unit,
      path: path,
      icon: icon,
      type: type
    }
  end
end
