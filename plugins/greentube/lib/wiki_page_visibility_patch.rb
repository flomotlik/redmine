module WikiPageVisibilityPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :visible?, :access_list
    end
  end

  module InstanceMethods
    def visible_with_access_list?
      puts 'Baaaaaaaaaaaaam'
      binding.pry
      visible_without_access_list?
    end

    def clean_access_ids
      access_ids.reject!{|a| a.empty?}
    end
  end
end

WikiPage.send(:include, WikiPageVisibilityPatch)
