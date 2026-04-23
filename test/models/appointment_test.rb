require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  test "should have a valid status from enum" do
    app = Appointment.new
    assert_respond_to app, :scheduled?
    assert_respond_to app, :completed?
  end
end