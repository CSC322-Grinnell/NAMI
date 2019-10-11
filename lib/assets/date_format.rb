class TimeSetter
    def initialize(d)
      @d = d
    end

    def is_leap_year(y)
        if y % 4 == 0
            if y % 100 == 0 && y % 400 != 0 # every centennial year not divisible by 400 is a non-leap year
                return false
            else
                return true
            end
        else
            return true
        end
    end
  
    def iso8601_ordinal # date format in ISO 8601 ordinal 
      d = @d
      y = 1980
      normal_yr_days = 365
      leap_yr_days = 366
      while (d >= normal_yr_days) do
        if is_leap_year(y) && d >= leap_yr_days
            d -= leap_yr_days
        elsif is_leap_year(y) && d == (leap_yr_days - 1) # last day of a leap year
            break
        else # normal length year
            d -= normal_yr_days
        end
        y -= 1
      end
      return y.to_s + "-" + d.to_s
    end
  end