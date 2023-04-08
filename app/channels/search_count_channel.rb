class SearchCountChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'search_count'
    puts 'Subscribed to search_count channel'
  end

  def unsubscribed; end

  def broadcast_search_count(search_count_data)
    puts "Broadcasting search count data: #{search_count_data}"
    ActionCable.server.broadcast('search_count', search_count_data)
  end
end
