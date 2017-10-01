module SiteHelper
  def get_total_budget
    budget = 0
    Category.all.map { |c| budget += c.budget unless c.budget.nil? }

    return budget
  end

  def get_total_expense
    curr_date = DateTime.now
    expense = 0
    Transaction.where(payment_type: :PAY).where(created_at: curr_date.beginning_of_month..curr_date.end_of_month ).map { |t| expense += t.amount }

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
end
