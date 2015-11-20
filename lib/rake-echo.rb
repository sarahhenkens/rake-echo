module Echo
  class ProgressBar
    attr_accessor :total, :current, :cols

    def initialize(total)
      @total = total
      @current = 0
      @cols = 20
    end

    def increment(amount=1)
      @current += amount

      display
    end

    def percentage
      current.to_f / total.to_f
    end

    def display
      current_col = (cols * percentage).round
      current_perc = (percentage * 100.0).round(2)
      STDOUT.print("\r" + current_perc.to_s + " % ")
      STDOUT.print("[" + "#" * current_col + "_" * (cols - current_col) + "]")
      STDOUT.flush
    end
  end
end
