# The following implements polyfills for Rails < 6.0
module ActionCable
  # If the Rails 6.0 ActionCable::TestHelper is missing then allow it to autoload
  unless ActionCable.const_defined? "TestHelper"
    autoload :TestHelper, "rails_6_polyfills/actioncable/test_helper.rb"
  end
  # If the Rails 6.0 test SubscriptionAdapter is missing then allow it to autoload
  unless ActionCable.const_defined? "SubscriptionAdapter::Test"
    module SubscriptionAdapter
      autoload :Test, "rails_6_polyfills/actioncable/test_adapter.rb"
    end
  end
end

# If the Rails 6.0 ActionJob DurationSerializer is missing then allow it to autoload
unless Object.const_defined?("ActiveJob::Serializers::DurationSerializer")
  require "rails_6_polyfills/activejob/duration_serializer"
end