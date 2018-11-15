class BaseSerializer
  class << self
    protected

    def attribute(*attrs)
      @@keys ||= {}
      @@keys[self.to_s] ||= []
      attrs.each do |attribute|
        @@keys[self.to_s].push attribute
      end
    end
  end

  def initialize(obj)
    @obj = obj
  end

  def to_json
    base.to_json
  end

  def to_hash
    base
  end

  # def to_json
  #   @obj.send(:attributes).to_json
  # end

  def try_send_key(key)
    if respond_to? key #Override by serializer
      send(key)
    else
      begin
        @obj.send(key)
      rescue
        raise $ERROR_INFO
      end
    end
  end

  protected
    def object
      @obj
    end


  private
    def base
      result = {}
      @@keys[self.class.to_s]&.each do |key|
        value = try_send_key(key)
        result = result.merge(key => value) unless value.nil?
      end
      return result
    end
end
