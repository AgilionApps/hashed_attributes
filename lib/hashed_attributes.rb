module HashedAttributes

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def hashed_attributes name, *options
      include InstanceMethods

      serialize name.to_sym, Hash

      options.each do |n|
        define_method "#{n}" do
          get_hashed_attribute_for(name)
        end

        define_method "#{n}=" do |arg|
          set_hashed_attribute_for(n,arg)
        end
      end

      define_method "hashed_attributes_column" do
        name
      end

      self.after_initialize do
        self[hashed_attributes_column] = {} if self[hashed_attributes_column].nil?
      end
    end
  end

  module InstanceMethods
    def get_hashed_attribute_for(key)
      self[hashed_attributes_column][key]
    end

    def set_hashed_attribute_for(key,value)
      self[hashed_attributes_column][key]=value
    end
  end

end
ActiveRecord::Base.send(:include, HashedAttributes)
