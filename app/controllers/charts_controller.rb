class ChartsController < ApplicationController
  def render_charts
    render turbo_stream: turbo_stream.replace(
      'charts',
      partial: 'charts/charts',
      locals: { top_global_searches: Query.top_global_searches,
                top_user_searches: Query.top_user_searches(@current_user.id) },
    )
  end
end
