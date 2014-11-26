class HaveJsonKey
  def initialize(expected_key, options)
    @expected_key = expected_key
    @options = options
  end

  def matches?(controller)
    @body = MultiJson.load(controller.response.body)

    result = @body.key?(@expected_key.to_s)
    result = @body[@expected_key.to_s] == @options[:value] if @value_provided
    result
  end

  def with_value(value)
    @options[:value] = value
    @value_provided = true
    self
  end

  def description
    result = "have json key #{@expected_key.inspect}"
    result << " with value #{@expected_val.inspect}" if @val_provided
    result
  end

  def failure_message
    "expected response to have json key #{@expected_key} but was not there"
  end

  def negative_failure_message
    "expected response to not have json key #{@expected_key} but found it"
  end
end

def have_json_key(expected_key, options = {})
  HaveJsonKey.new(expected_key, options)
end
