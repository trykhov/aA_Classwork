class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      # self.instance_variable_set sets the value (writing the long way)
      define_method("#{name}=") {|val| self.instance_variable_set("@#{name}", val)}
      # self.instance_variable_set gets the variable value (written the long way)
      define_method(name) { self.instance_variable_get("@#{name}") }
    end 
  end
end
