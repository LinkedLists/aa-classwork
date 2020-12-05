
class KnightPathFinder
    #self.root_node(pos)  @root_node = PolyTreeNode.new(pos)
    #build_move_tree used to traverse the tree 
    #build_move_tree only used when #find_path is called
    #::valid_moves(pos) => returns an array, needs to check with @considered_positions

    self.valid_moves(pos)
        possible_moves = [ [2, 1], [1, 2], [-2, 1], [-2, -1], [-1, 2]  ]

    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [@root_node]
    end

end