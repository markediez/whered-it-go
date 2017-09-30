class ReminderTemplate < ApplicationRecord
  has_many :bill_templates
  validate :frequency_is_cron

  accepts_nested_attributes_for :bill_templates

  def trigger
    reminder_instance = Reminder.new(name: self.name)

    if reminder_instance.save
      self.bill_templates.each do |bill_template|
        bill_instance = Bill.new(name: bill_template.name, amount: bill_template.amount, url: bill_template.url)
        bill_instance.reminder = reminder_instance
        bill_instance.save!
      end
    end

    self.triggered_at = Time.now
    self.save!
  end

  private
  # Frequency is in CRONTAB format without MINUTE and HOUR
  # DayOfMonth MonthOfYear DayOfWeek
  # [1-31|\*]  [1-12|\*]   [0-6|\*]
  def frequency_is_cron
    # One-time reminder
    return if self.frequency.nil? || self.frequency.empty?

    fields = self.frequency.split(" ")
    errors.add(:frequency, "Invalid frequency format") unless fields.size == 3

    unless fields[0] == '*' || ( fields[0].to_i > 0 && fields[0].to_i < 32 )
      errors.add(:frequency, "First field must be * or an integer between 1 and 31")
    end

    unless fields[1] == '*' || ( fields[1].to_i > 0 && fields[1].to_i < 13 )
      errors.add(:frequency, "Second field must be * or an integer between 1 and 12")
    end

    unless fields[2] == '*' || ( fields[2].class == Integer && fields[2].to_i >= 0 && fields[2].to_i <= 6 )
      errors.add(:frequency, "Third field must be * or an integer between 0 and 6")
    end
  end
end
