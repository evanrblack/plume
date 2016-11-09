require 'test_helper'

describe PagesController do
  it 'must get home' do
    get '/'
    assert_response :success
  end

  it 'must be able to log in as a manager' do
    sign_in logins(:manager_login)
    get '/'
    assert_response :success
    assert_select 'h1', 'Acme Home Care'
  end

  it 'must be able to log in as a caregiver' do
    sign_in logins(:caregiver_login)
    get '/'
    assert_response :success
    assert_select 'h1', 'Dashboard'
  end
end
