module HashedAttributes

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def hashed_attributes name, *options
      include InstanceMethods

      serialize name, Hash

      options.each { |key|
        define_method(key) { get_hashed_attribute_for(key) }
        define_method("#{key}=") { |value| set_hashed_attribute_for(key,value) }
      }

      define_method("hashed_attributes_column") { name }
      define_method("hashed_attributes_keys") { options }

      self.after_initialize do
        initialize_hashed_attributes
      end
    end
  end

  module InstanceMethods
    protected

    def get_hashed_attribute_for(key)
      self[hashed_attributes_column][key]
    end

    def set_hashed_attribute_for(key,value)
      initialize_hashed_attributes
      self[hashed_attributes_column][key]=value
    end

    def initialize_hashed_attributes
      self[hashed_attributes_column] = {} if self[hashed_attributes_column].nil?
    end
  end

end

ActiveRecord::Base.send(:include, HashedAttributes)
