require 'test_helper'

class AttendeeControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get attendee_create_url
    assert_response :success
  end
end
