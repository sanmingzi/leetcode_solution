# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  return intervals if(new_interval == nil || new_interval.empty?)
  rtns = []
  rtns << new_interval
  intervals.each do |interval|
      last_interval = rtns.last
      if(is_overlap?(interval, last_interval))
          last_interval[0] = [last_interval[0], interval[0]].min
          last_interval[1] = [last_interval[1], interval[1]].max
      else
          if(interval[0] < last_interval[0])
              rtns.pop
              rtns << interval
              rtns << last_interval
          else
              rtns << interval
          end
      end
  end
  return rtns
end

def is_overlap?(interval1, interval2)
  return false if(interval1[1] < interval2[0] || interval2[1] < interval1[0])
  return true
end
