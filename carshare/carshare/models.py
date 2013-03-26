from django.db import connection, transaction

 
class Reservation(object):

    def __init__(self, res_tuple):
        self.id = res_tuple[0]
        self.pickupDate = res_tuple[1]
        self.pickupTime = res_tuple[2]
        self.duration = res_tuple[3]
        self.carNum = res_tuple[4]
        self.memNum = res_tuple[5]
        self.locNum = res_tuple[6]

def reservations_for_day(date):
    dateStr = date.isoformat()

    cursor = connection.cursor()
    cursor.execute('''
        select * from reservation where PickupDate = %s
        '''
    , [dateStr])

    return cursor.fetchall()

class Car(object):

    def __init__(self, car_tuple):
        self.id = car_tuple[0]
        self.VIN = car_tuple[1]
        self.make = car_tuple[2]
        self.model = car_tuple[3]
        self.year = car_tuple[4]
        self.lastOD = car_tuple[5]
        self.lastGas = car_tuple[6]
        self.locNum = car_tuple[7]

def car_by_id(id):
    cursor = connection.cursor()
    cursor.execute('''
        select * from car where CarNum = %s
        '''
    , [id])

    car_tuple = cursor.fetchone()

    return Car(car_tuple)


class Member(object):

    def __init__(self, mem_tuple):
        self.id = mem_tuple[0]
        self.name = mem_tuple[1]
        self.addres = mem_tuple[2]
        self.phonNum = mem_tuple[3]
        self.email = mem_tuple[4]
        self.license = mem_tuple[5]
        self.aniversary = mem_tuple[6]
        self.ccnum = mem_tuple[7]
        self.ccexp = mem_tuple[8]


def member_by_id(id):
    cursor = connection.cursor()
    cursor.execute('''
        select * from member where MemNum = %s
        '''
    , [id])

    mem_tuple = cursor.fetchone()

    return Member(mem_tuple)

class Location(object):

    def __init__(self, tuple):
        self.id = tuple[0]
        self.address = tuple[1]
        self.numSpaces = tuple[2]

def location_by_id(id):
    cursor = connection.cursor()
    cursor.execute('''
        select * from location where LocNum = %s
        '''
    , [id])

    tuple = cursor.fetchone()

    return Location(tuple)