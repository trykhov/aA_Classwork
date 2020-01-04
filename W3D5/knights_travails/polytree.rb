class PolyTreeNode
    attr_reader :value
    attr_accessor :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        # either self already has a parent or it doesn't
        # if it doesn't, @parent = nil
        # if it does, are we reassigning?
            # remove self from it's current_parent.children
            # then assign self.parent = node
            # then add self to parent.children

        if !self.parent.nil?
            prev_parent = self.parent
            prev_parent.children = prev_parent.children.select do |child| 
                child != self
            end
        end

        if node != nil && !node.children.include?(self)
            @parent = node
            node.children << self
        else
            @parent = nil
        end
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        raise "Not a child" if node.parent.nil?
        node.parent = nil
    end

    def inspect
        p self.value
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child| 
            is_target = child.dfs(target)
            return is_target unless is_target.nil?
        end
        nil
    end

    def bfs(target)
        return nil if self.nil?
        queue = []
        queue << self
        while !queue.empty?
            node = queue.shift
            return node if node.value == target
            queue += node.children
        end
        nil
    end

end