# frozen_string_literal: true

class ExampleReflex < ApplicationReflex

  def increment
    count = session[:count] || 0
    session[:count] = count + 1

    morph "#time", Time.now
    morph "#count", session[:count]

    cable_ready.set_value(selector: "progress", value: session[:count])

    if session[:count] == 5
      cable_ready.text_content(selector: "#reload", text: "Try reloading your browser window. The count is persisted in the session!")
    end

    if session[:count] >= 10
      cable_ready.dispatch_event(name: "fireworks")
    end
  end

  def reset
    session[:count] = 0
  end

  def testing
    true
  end
end
