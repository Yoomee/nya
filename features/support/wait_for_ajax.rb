# helper to wait until all ajax has completed
# see: http://robots.thoughtbot.com/automatically-wait-for-ajax-with-capybara
module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end