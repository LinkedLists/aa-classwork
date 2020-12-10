
require "singleton"
require_relative "board"
require_relative "moves"

class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
    end

    def valid_moves 
        # possible moves for this type of Piece
    end

    def pos=(val)
        @pos = val
    end

    def Symbol
        @color
    end

    private
    def move_into_check?(end_pos)
        
    end

 end

# class SlidingPiece < Piece
#     def initialize
#         super
#     end

#     def Symbol
#         rook = :r
#         bishop = :b
#         queen = :q

#     end

#     private
#     def move_dirs

#     end
# end

class NullPiece# < Piece
    include Singleton
    def initialize#(color, board, pos)
        #super
    end
end


class Rook < Piece
    include Slideable
    attr_reader :board
    def initialize(color, board, pos)
        super
    end
    
end
