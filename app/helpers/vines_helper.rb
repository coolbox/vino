module VinesHelper
  def feed_title(video)
    title = video.description
    title += " #mustwatch " if video.loops.onFire == 1
    title = title.strip
    return title
  end
end
