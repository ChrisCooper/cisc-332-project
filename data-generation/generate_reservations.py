from datetime import *
from random import *

num_reservations = 12
num_cars = 6
num_locs=3
num_members = 3

for res_num in range(num_reservations):

    today = date.today()
    delta = timedelta(days=randint(-10,10))
    rental_date = today + delta

    rental_time = "'{0:02d}:{1:02d}'".format(randint(8, 17), choice([0, 30]))

    duration = randint(1,6)

    car_num = randrange(num_cars)
    loc_num = randrange(num_locs)
    member_num = randrange(num_members)

    res = ", ".join([str(s) for s in [res_num, "'" + rental_date.isoformat() + "'",
                rental_time, duration,
                car_num, member_num,
                loc_num]]
                )

    cost = ", ".join([str(s) for s in [res_num, "'" + rental_date.isoformat() + "'",
                0, res_num, member_num]]
                )

    print("({0}),".format(res))
    print("({0}),".format(cost))


#(0, '2013-Mar-04', '13:00', 5, 0, 0, 0)
