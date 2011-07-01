class Routes
  include ActionView::Helpers::TextHelper 

  def initialize(json_result)
    @hash_result = ActiveSupport::JSON.decode(json_result)
  end

  def founded?
    self.status == "OK"   
  end

  def status
    @hash_result["status"]
  end

  def detailed_start_address
    first_route["start_address"]
  end

  def detailed_end_address
    first_route["end_address"]
  end

  def distance
    first_route["distance"]["text"]
  end

  def duration
    first_route["duration"]["text"]
  end

  def steps
    first_route["steps"].collect do |step|
      instruction = "[#{pluralize(step["distance"]["value"], "meter")}] [#{pluralize(step["duration"]["value"], "second")}] #{step["html_instructions"].html_safe}"
    end
  end

  private

  def first_route
    @hash_result["routes"][0]["legs"][0] if founded?
  end
end
