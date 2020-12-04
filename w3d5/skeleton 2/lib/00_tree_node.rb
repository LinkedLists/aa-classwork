require "byebug"

class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(value)

        if @parent != nil 
            @parent.children.delete(self)
        end

        @parent = value
        if value != nil
            if !@parent.children.include?(self)
                @parent.children << self
            end
        end

    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if !@children.include?(child)
            raise 'Not my child'
        end
        @children.delete(child)
        child.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        # return self if self.children == []

        @children.each do |child|
            search_result = child.dfs(target_value)
            return search_result if search_result != nil
        end
        #iterate self child
        #pull each child
        #result = dfs(child, target_val)
        #if child.value == target_val
        #return result if result != nil
        
    end
    
end
