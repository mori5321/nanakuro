class UniqueIdGeneratorService
  def initialize(repo, hexdigit: 12)
    @repo = repo
    @hexdigit = hexdigit
    validate
  end

  def exec
    begin
      token = SecureRandom.hex(@hexdigit)
    end while @repo.find_by_unique_id(token)
    return token
  end

  private
    def validate
      raise NotImplementedError.new("You must Implement #find_by_unique_id on #{@repo.class} class") unless @repo.respond_to?(:find_by_unique_id)
    end
end
