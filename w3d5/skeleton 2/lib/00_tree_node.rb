require "byebug"

class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(value)
        # debugger
        # old_parent = self.parent
        if @parent != nil 
            @parent.children.delete(self)
        end
        # if value != nil
        # if value != nil && @parent != nil
            # 
        @parent = value
        if value != nil
            if !@parent.children.include?(self)
                @parent.children << self
            end
        end
        # else
            
        # end

    end

    
end

a = PolyTreeNode.new(1)
b = PolyTreeNode.new(2)
a.parent = nil
