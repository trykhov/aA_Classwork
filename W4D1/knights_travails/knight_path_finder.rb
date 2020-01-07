require_relative "polytree"

class KnightPathFinder

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @consider_pos = [@root_node] # array of PolyTreeNode objects
    end

    def self.valid_moves(pos)
        x, y = pos
        possible_moves = {}

        moves = [[1, 2], [1, -2], [-1, 2], [-1, -2],
                 [2, 1], [2, -1], [-2, 1], [-2, -1]]

        moves.each do |pair|
            x2, y2 = pair
            if (0 <= x + x2) && (x + x2 < 8) && (0 <= y + y2)  && (y + y2 < 8)
                pair = [x + x2, y + y2]
                possible_moves[pair] = PolyTreeNode.new(pair)
            end
        end
        possible_moves
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        @consider_pos.each do |move|
            if possible_moves.has_key?(move.value)
                possible_moves[move.value] = nil
            end
        end
        consider = possible_moves.select { |k, v| v != nil }.values
        @consider_pos += consider 
        consider
    end

    def build_move_tree
        @consider_pos.each do |branch|
            new_children = new_move_positions(branch.value)
            new_children.each do |child|
                child.parent = branch
                branch.add_child(child)
            end
        end
        # we know that new_move_positions will be children of a parent move
        # @consider_pos that will be every possible legal node
        # have to use breath-first (will help us)
        # once we find node using BFS, can trace back path using @parent
    end
end


knight = KnightPathFinder.new([1,1])
knight.build_move_tree
