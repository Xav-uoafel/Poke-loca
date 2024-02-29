class PagesController < ApplicationController
  def home
  end

  def xavier
    @markers = [
      {
        lat: 43.599550943705445,
        lng: 1.4570582000627619,
        info_window_html: render_to_string(partial: "info_window"),
        marker_html: render_to_string(partial: "marker")
      }
    ]
  end
end
