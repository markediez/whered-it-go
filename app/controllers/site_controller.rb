class SiteController < ApplicationController
  include SiteHelper
  
  def index
    @categories = Category.all
    @transactions = Transaction.all
    @reminders = Reminder.where archived: false
    @bills = Bill.all
    @errors = flash[:error]

    trigger_templates(DateTime.now)
  end

  def templates
    @reminder_templates = ReminderTemplate.all
  end
end
