require 'prime'

def prime_finder(num)
  start = Time.now
  primes = []
  i = 0
  until primes.length == num
    primes << i if i.prime?
    i += 1
  end

  finish = Time.now
  elapsed_time = finish - start
  elapsed_time
end

def prime_finder2(primes, i, start_time)
  start_time = Time.now if start_time.nil?
  if primes.length == 1000
    Time.now - start_time

  else
    primes << i if i.prime?
    prime_finder2(primes, i + 1, start_time)
  end
end

class Integer

  def prime_dance(num)
    start = Time.now
    require 'prime'
    primes = []
    i = self
    until primes.length == num
      primes << i if i.prime?
      i += 1
    end

    Time.now - start
  end
end
