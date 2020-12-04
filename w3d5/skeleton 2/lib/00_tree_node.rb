require "byebug"

class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent = parent
        @children = []
        @value = value
    end

    def parent=(value)
        # debugger
        if value != nil
            @parent = value
            if !@parent.children.include?(self)
                @parent.children << self
            end
        else
            
        end

    end

    
end

a = PolyTreeNode.new(1)
b = PolyTreeNode.new(2)
a.parent = nil
