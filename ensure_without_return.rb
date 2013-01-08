def ensure_without_return
  yield
ensure
  puts 'ensure'
  true
end

ensure_without_return { puts 'block'; false }
#
#block
#ensure
#=> false
#

ensure_without_return { raise 'exception raised'; puts 'block'; false }
#
#ensure
#RuntimeError: exception raised
#  from (irb):21
#  from (irb):16:in `ensure_without_return'
#  from (irb):21