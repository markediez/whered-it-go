module SiteHelper
  def get_total_budget
    budget = 0
    Category.all.map { |c| budget += c.budget unless c.budget.nil? }

    return budget
  end

  def get_total_expense
    expense = 0
    Transaction.where(payment_type: :PAY).map { |t| expense += t.value }

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
