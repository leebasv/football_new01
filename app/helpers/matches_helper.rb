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
      render html: ("<p><strong>" + t("matches.show.finished") +
        "</strong></p>").html_safe
    end
  end
end
