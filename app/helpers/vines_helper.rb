module VinesHelper
  def feed_title(video)
    if video.loops.onFire == 1
      "#{video.description} #mustwatch"
    else
      video.description
    end
  end
end
