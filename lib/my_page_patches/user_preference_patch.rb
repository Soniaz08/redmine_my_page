module MyPagePatches
  module UserPreferencePatch

    def self.included(base) # :nodoc:
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)

      base.class_eval do
        unloadable
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def landing_page; self[:landing_page] end
      def landing_page=(value); self[:landing_page]=value end

      def my_cust_query
        if self[:my_cust_query].nil?
          self[:my_cust_query] = Hash.new
          self[:my_cust_query][:query_ids]= []
          save
        end
        self[:my_cust_query]
      end

      def my_cust_query=(value); self[:my_cust_query]=value end
    end
  end
end