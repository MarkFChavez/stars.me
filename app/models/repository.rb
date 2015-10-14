class Repository
  attr_accessor :full_name, :desc, :stars

  def self.build!(data = {})
    new(data).build
  end

  def initialize(data)
    @data = data
  end

  def build
    self.full_name = @data["full_name"]
    self.desc = @data["description"]
    self.stars = @data["stargazers_count"]

    self
  end
end
