module Arel
  class SelectManager < Arel::TreeManager
    def initialize engine
      super
      @head   = Nodes::SelectStatement.new
      @ctx    = @head.cores.last
    end

    def from table
      @ctx.froms << table
      self
    end

    def project projection
      @ctx.projections << projection
      self
    end

    def where expr
      @ctx.wheres << expr
      self
    end

    def take limit
      @head.limit = limit
      self
    end
  end
end
