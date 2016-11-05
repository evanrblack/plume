require 'test_helper'

describe PagesController do
  it 'must get home' do
    get '/'
    assert_response :success
  end
end
