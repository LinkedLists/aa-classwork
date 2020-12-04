class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(value)
        if value != nil
            @parent = value
        else
            @parent = nil
        end
        
        if !@parent.children.include?(self)
            @parent.children << self
        end

    end
end