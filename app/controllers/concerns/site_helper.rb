module SiteHelper
  def get_goal_progress(goal)
    transactions = Transaction.where(:category_id => goal.id).where(:created_at => get_date_range(goal.created_at, DateTime.now))

    progress = 0
    transactions.map { |t| progress += t.amount }
    return progress
  end

  def get_date_range(from=nil, till=nil)
    from = DateTime.now.beginning_of_month if from == nil
    till = DateTime.now.end_of_month if till == nil

    return from..till
  end

  def get_total_budget
    budget = 0
    Category.where(:category_type => :BUDGET).map { |c| budget += c.amount unless c.amount.nil? }

    return budget
  end

  def get_total_expense
    curr_date = DateTime.now
    expense = 0
    Transaction.where(payment_type: :PAY).where(created_at: get_date_range ).map { |t| expense += t.amount }

    return expense
  end

  def get_comment(budget, expense)
    difference = budget - expense
    if difference < 0
      message = "#{number_to_currency(difference)} over budget"
    elsif difference > 0
      message = "#{number_to_currency(difference)} under budget"
    else
      message = "Just right"
    end

    return message
  end

  def trigger_templates(date)
    ReminderTemplate.all.each do |rt|
      # DAY MONTH YEAR
      cron = rt.frequency.split " "
      supposed_trigger_date = DateTime.now.change(hour: 0, minute: 0, second: 0)
      supposed_trigger_date = supposed_trigger_date.change(day: cron[0].to_i) unless cron[0] == "*"
      supposed_trigger_date = supposed_trigger_date.change(month: cron[1].to_i) unless cron[1] == "*"

      rt.trigger if rt.triggered_at < supposed_trigger_date
    end
  end
end
