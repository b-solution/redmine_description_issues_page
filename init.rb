Redmine::Plugin.register :redmine_description_issues_page do
  name 'Redmine Description Issues Page'
  author 'FlexSolution'
  description 'Make possible to show description on issues page'
  version '0.0.2'
  url 'https://git.flex-solution.com/Simplex/redmine_description_issues_page/'
  author_url 'https://www.flex-solution.com'

  require 'issues_context_menu_issues_hook'
end
require 'user'
require 'query'
Rails.application.config.to_prepare do
  Issue.send(:include, RedmineDescriptionIssuesPage::IssuePatch)
  IssueQuery.send(:include, RedmineDescriptionIssuesPage::IssueQueryPatch)
  QueryColumn.send(:include, RedmineDescriptionIssuesPage::QueryPatch)
  QueriesHelper.send(:include, RedmineDescriptionIssuesPage::QueriesHelperPatch)
end
