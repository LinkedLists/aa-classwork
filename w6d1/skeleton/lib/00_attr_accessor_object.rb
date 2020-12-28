class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      define_method(name) do #lol define one at a time dude
        self.instance_variable_get("@#{name}")
        # def :@name=(arg)
        #   @name = arg
        # end
        # def self.name
        #   name
        # end
      end

      define_method("#{name}=") { |arg| self.instance_variable_set("@#{name}", arg)} #need @ to refer to instance var???
    end
  end


end
