module Echo
  class ProgressBar

    attr_reader :total
    attr_reader :current
    attr_reader :start_time

    def initialize(total)
      @total = total
      @current = 0
      @start_time = Time.now
      @previous_time = @start_time
    end

    def increment(amount=1)
      @current += amount
      display

      finish if completed?
    end

    def percentage
      current.to_f / total.to_f
    end

    def completed?
      @current == @total
    end

    private

    def display
      width = 20

      current_col = (width * percentage).round
      current_perc = (percentage * 100.0).round(2)

      bar = "\r%+6.6s [%s%s] | %s" % [
        current_perc.to_s + "%",
        "#" * current_col,
        "_" * (width - current_col),
        eta
      ]

      $stdout.print(bar)
      $stdout.flush
    end

    def finish
      $stdout.print("\n")
      $stdout.flush
    end

    def eta
      time = if @current == 0
        "--:--:--"
      else
        elapsed = Time.now - @start_time
        eta = (elapsed / @current) * (@total - @current);
        Time.at(eta).utc.strftime "%H:%M:%S"
      end

      "ETA: %s" % time
    end

  end
end
