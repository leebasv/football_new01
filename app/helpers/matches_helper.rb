module MatchesHelper
  def show_result
    case @match.status.to_sym
    when :not_occur
      render html: ("<p><strong>" + t("matches.show.not_occur") +
        "</strong></p>").html_safe
    when :live
      render html: ("<p><strong>" + t("matches.show.live") +
        "</strong></p>").html_safe
    when :finished
      render_match_result
    end
  end

  def render_match_result
    render html: ("<p><strong>" + t("matches.show.finished") +
      "</strong></p>" + "<p>" + @match.match_result_score1.to_s +
      "<strong> - </strong>" + @match.match_result_score2.to_s +
      "</p>").html_safe
  end

  def set_status_by_time match
    relaxhalftime = Settings.minhalftime
    secpermin = Settings.seconds
    beginmatchtime = match.match_date.to_i
    endmatchtime = beginmatchtime + (relaxhalftime + match
      .extra_time2 + match.extra_time1 + match.time) * secpermin
    timenow = Time.current.to_i
    match.status = if beginmatchtime > timenow
                     Match.statuses[:not_occur]
                   elsif endmatchtime > timenow
                     Match.statuses[:live]
                   else
                     Match.statuses[:finished]
                   end
  end
end
