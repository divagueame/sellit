require "test_helper"

class FetchCountryJobTest < ActiveJob::TestCase
   test "enqueue country jobs" do
     enqueue_jobs 0
     FetchCountryJob.perform_later('1', '0.0.0.0')
     enqueue_jobs 1
   end
end
