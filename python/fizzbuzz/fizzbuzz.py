for i in range(1,101):
    
    fizzbuzz = False
    
    if (i % 3 == 0):
        print "Fizz"
        fizzbuzz = True
    
    if (i % 5 == 0):
        print "Buzz"
        fizzbuzz = True

    if not fizzbuzz:
        print i
