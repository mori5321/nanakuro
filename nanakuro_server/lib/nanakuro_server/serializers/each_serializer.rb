class EachSerializer
  def initialize(array, serializer)
    @array = array
    @serializer = serializer
  end

  def to_json
    base.to_json
  end

  private
    def base
      @array.map {|instance| @serializer.new(instance).to_hash }
    end
end
