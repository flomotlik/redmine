module DependentProjectsPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :statement, :dependent_projects
    end
  end

  module InstanceMethods
    def statement_with_dependent_projects
      "(#{statement_without_dependent_projects}) OR (issues.id IN (SELECT issues.id FROM issues LEFT OUTER JOIN custom_values ON custom_values.customized_type='Issue' AND issues.id=customized_id
LEFT OUTER JOIN custom_fields ON custom_values.custom_field_id=custom_fields.id WHERE custom_fields.name='dependent_project' AND custom_values.value = '#{project.id}'))"
    end
  end
end

Query.send(:include, DependentProjectsPatch)
