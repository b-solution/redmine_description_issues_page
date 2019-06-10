module RedmineDescriptionIssuesPage
  module QueriesHelperPatch
    def self.included(base)
      base.send :include, InstanceMethods

      base.class_eval do
        alias_method :column_value_without_default, :column_value
        alias_method :column_value, :column_value_with_default
      end
    end

    module InstanceMethods
      def column_value_with_default(column, item, value)
        if column.name == :column_description
          item.description? ? content_tag('div', truncate(strip_tags(textilizable(item, :description) ), length: 200),style: 'color: #333 !important', :class => "wiki") : ''
        else
          column_value_without_default(column, item, value)
        end
      end
    end
  end
end
