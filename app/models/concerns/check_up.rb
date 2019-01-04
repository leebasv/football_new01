module CheckUp
  def check_status score_bet
    return unless score_bet&.pending?
    check_outcome score_bet
  end

  def check_outcome score_bet
    if score_bet.outcome == check_result
      score_bet.win
      change_score_bet_status score_bet
      UserMailer.send_success_bet(score_bet.user).deliver_now
    else
      change_score_bet_status score_bet
      UserMailer.send_fail_bet(score_bet.user).deliver_now
    end
  end

  def change_score_bet_status score_bet
    score_bet.completed!
  end
end
