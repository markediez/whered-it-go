class SiteController < ApplicationController
  def index
    @categories = Category.all
    @transactions = Transaction.all
    @reminders = Reminder.where archived: false
    @errors = flash[:error]

  end
end
