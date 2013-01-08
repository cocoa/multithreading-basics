def ensure_without_return
  yield
ensure
  puts 'ensure'
  return true
end

ensure_without_return { puts 'block'; false }
#
#block
#ensure
#=> true
#

ensure_without_return { raise 'exception raised'; puts 'block'; false }
#
#ensure
#=> true