from django.db import connection, transaction

 
class Reservation(object):

    def __init__(self, res_tuple):
        self.id = res_tuple[0]
        self.pickupDate = res_tuple[1]
        self.pickupTime = res_tuple[2]
        self.duration = res_tuple[3]

def reservations_for_day(date):
    dateStr = date.isoformat()

    cursor = connection.cursor()
    cursor.execute('''
        select * from reservation where PickupDate = %s
        '''
    , [dateStr])

    return cursor.fetchall()