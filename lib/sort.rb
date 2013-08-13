class Sort

  def initialize(data, field, direction)
    @data = data
    @field = field
    @direction = direction
  end

  def execute
    @data = @data.order(@field.to_s + ' ' + @direction.to_s)
    @data
  end

end
