class HotSpring < ApplicationRecord
  enum running_status: {running: 0, interrupt: 1, closed: 2 }
end
