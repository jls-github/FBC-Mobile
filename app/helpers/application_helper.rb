module ApplicationHelper
  # Returns true when the request comes from a Hotwire Native iOS or Android shell.
  # The native SDKs set a "Hotwire Native" User-Agent prefix automatically.
  def hotwire_native_app?
    request.user_agent.to_s.include?("Hotwire Native")
  end
end
