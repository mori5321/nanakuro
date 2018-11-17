class EachSerializer
  def initialize(array, serializer)
    @array = array
    @serializer = serializer
  end

  def to_json
    base.to_json
  end

  def to_hash
    base
  end

  private
    def base
      @array.map {|instance| @serializer.new(instance).to_hash }
    end
end
