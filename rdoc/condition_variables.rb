# A condition variable is simply a semaphore that is associated with a resource and 
# is used within the protection of a particular mutex. When you need a resource that's 
# unavailable, you wait on a condition variable. That action releases the lock on the 
# corresponding mutex. When some other thread signals that the resource is available, 
# the original thread comes off the wait and simultaneously regains the lock on the 
# critical region.

require 'thread'
mutex = Mutex.new
cv = ConditionVariable.new

a = Thread.new do
	mutex.synchronize do
		p "A: I have critical section, but will wait for cv"
    cv.wait(mutex)
    p "A: I have critical section again! I rule!"
	end
end

sleep 1
p '(Later, back at the ranch...)'


b = Thread.new do
	mutex.synchronize do
		p "B: Now I am critical, but am done with cv"
    cv.signal
    p "B: I am still critical, finishing up"
	end	
end


a.join
b.join