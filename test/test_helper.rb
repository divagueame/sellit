ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers 
  parallelize(workers: :number_of_processors)

  fixtures :all

  def login
    post sessions_path, params: { login: 'john@john.com', password: 'testme' }
  end
end
