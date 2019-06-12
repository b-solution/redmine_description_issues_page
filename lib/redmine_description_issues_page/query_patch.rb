module RedmineDescriptionIssuesPage
  module QueryPatch
    def self.included(base)
      base.send :include, InstanceMethods

      base.class_eval do
         alias_method :css_classes_without_default, :css_classes
        alias_method :css_classes, :css_classes_with_default
      end
    end

    module InstanceMethods
      def css_classes_with_default
        name == :column_description ? :status : name
      end
    end
  end
end
