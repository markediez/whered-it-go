class SiteController < ApplicationController
  include SiteHelper

  def index
    @current_user = User.first
    @transactions = Transaction.all
    @budgets = Category.where(:category_type => "BUDGET")
    @goals = Category.where(:category_type => "GOAL")
    @reminders = Reminder.where archived: false
    @bills = Bill.all
    @errors = flash[:error]

    trigger_templates(DateTime.now)
  end

  def templates
    @reminder_templates = ReminderTemplate.all
  end
end
