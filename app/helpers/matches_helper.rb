module MatchesHelper
  def show_result
    case @match.status.to_sym
    when :not_occur
      render html: ("<p><strong>" + t("matches.show.not_occur") +
        "</strong></p>").html_safe
      render "score_bets/score_bet"
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
    relax_half_time = Settings.min_half_time
    sec_per_min = Settings.seconds
    begin_match_time = match.match_date.to_i
    end_match_time = begin_match_time + (relax_half_time +
      match.extra_time2 + match.extra_time1 + match.time) * sec_per_min
    time_now = Time.current.to_i
    match.status = get_status begin_match_time, time_now, end_match_time
  end

  def get_status begin_match_time, time_now, end_match_time
    if begin_match_time > time_now
      Match.statuses[:not_occur]
    elsif end_match_time > time_now && begin_match_time <= time_now
      Match.statuses[:live]
    else
      Match.statuses[:finished]
    end
  end
end
