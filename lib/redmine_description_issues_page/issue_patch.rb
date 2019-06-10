module RedmineDescriptionIssuesPage
  module IssuePatch
    def self.included(base)
      base.send :include, InstanceMethods

      base.class_eval do

      end
    end

    module InstanceMethods
      def column_description
        description
      end
    end
  end
end
