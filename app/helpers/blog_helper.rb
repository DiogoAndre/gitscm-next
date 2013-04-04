module BlogHelper
  def list_entries
    path = "#{Rails.root}/app/views/blog/posts/*.*"
    entries = []
    Dir[path].each do |uri|
      file = uri.match(/^.*\/(.{10})(.*).(markdown|html)/)
      entries << {:uri => file[0], 
                  :date_published => Date.parse(file[1]),
                  :title=> file[2].titleize,
                  :slug => file[2].parameterize
                }
    end
    entries = entries.sort_by { |k| k[:date_published] }.reverse
  end

  def format_path(entry)
    "/blog/#{entry[:date_published].year}/#{entry[:date_published].strftime('%m')}/#{entry[:date_published].strftime('%d')}/#{entry[:slug]}.html"
  end
end
