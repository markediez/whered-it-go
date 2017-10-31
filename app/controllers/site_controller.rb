class SiteController < ApplicationController
  include SiteHelper

  def index
    @fund = Fund.first
    @transactions = Transaction.all
    @budgets = Category.where(:category_type => "BUDGET")
    @goals = Category.where(:category_type => "GOAL")
    @reminders = Reminder.where archived: false
    @bills = Bill.where archived: false
    @errors = flash[:error]

    trigger_templates(DateTime.now)
  end

  def templates
    @reminder_template = ReminderTemplate.new
    @reminder_templates = ReminderTemplate.all
  end
end
