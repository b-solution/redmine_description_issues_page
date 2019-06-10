module RedmineDescriptionIssuesPage
  module IssueQueryPatch
    def self.included(base)
      base.send :include, InstanceMethods

      base.class_eval do
        alias_method :available_columns_without_default, :available_columns
        alias_method :available_columns, :available_columns_with_default
        end
    end

    module InstanceMethods

      def available_columns_with_default
        return @available_columns if @available_columns
        @available_columns = available_columns_without_default

        @available_columns<< QueryColumn.new(:column_description, :sortable => "#{Issue.table_name}.description", :groupable => false)
        @available_columns
      end
    end
  end
end
