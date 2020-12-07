require_relative "00_tree_node"
require "byebug"

    #self.root_node(pos)  @root_node = PolyTreeNode.new(pos)
    #build_move_tree used to traverse the tree 
    #build_move_tree only used when #find_path is called
    #::valid_moves(pos) => returns an array, needs to check with @considered_positions

class KnightPathFinder
    attr_accessor :considered_positions, :root_node
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [@root_node]
    end

    def new_moves_position(pos)
        possible_pos = KnightPathFinder.valid_moves(pos)
        possible_pos.reject! { |a_pos| @considered_positions.include?(a_pos) }
    end

    def self.valid_moves(pos)
        x = pos[0]
        y = pos[1]

        possible_moves = [[2, 1], [1, 2], [-2, 1], [-2, -1], [-1, 2], [2, -1], [1, -2], [-1, -2]]

        possible_moves.map! do |pair|
            pair[0] += x
            pair[1] += y
            pair
        end 

        possible_moves.select! do |pair|
            (pair[0] >= 0 && pair[0] < 8) && (pair[1] >= 0 && pair[1] < 8)
        end

        possible_moves
    end
end

test = KnightPathFinder.new([0, 0])
print KnightPathFinder.valid_moves([6, 7])
# p test