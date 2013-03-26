from django.db import connection, transaction

import datetime
from dateutil import parser
 
class Reservation(object):

    def __init__(self, res_tuple=None):
        self.id = res_tuple[0]
        self.pickupDate = res_tuple[1]
        self.pickupTime = res_tuple[2]
        self.duration = res_tuple[3]
        self.carNum = res_tuple[4]
        self.memNum = res_tuple[5]
        self.locNum = res_tuple[6]

def all_reservations():
    cursor = connection.cursor()
    cursor.execute('''
        select * from Reservation
    ''')

    items = [Reservation(t) for t in cursor.fetchall()]

    return items

def reservations_for_day(date):
    dateStr = date.isoformat()

    cursor = connection.cursor()
    cursor.execute('''
        select * from reservation where PickupDate = %s
        '''
    , [dateStr])

    return cursor.fetchall()
    
def reservations_for_car(carNum):
    

    cursor = connection.cursor()
    cursor.execute('''
        select * from reservation where carNum = %s
        '''
    , [carNum])

    items = [Reservation(t) for t in cursor.fetchall()]

    for item in items:
        item.member = member_by_id(item.memNum)
        item.location = location_by_id(item.locNum)

    return items

def insert_reservation(post_dict):
    d = post_dict
    
    car = car_by_id(d['carNum'])

    cursor = connection.cursor()

    # Data modifying operation - commit required
    cursor.execute('''
        insert into Reservation values
        (DEFAULT, %s, %s, %s, %s, %s, %s);
    ''',
    [
        d['date'],
        d['time'],
        d['duration'],
        car.id,
        d['memNum'],
        car.locNum,
    ])
    transaction.commit_unless_managed()


class Car(object):

    def __init__(self, car_tuple=None):
        if car_tuple:
            self.id = car_tuple[0]
            self.VIN = car_tuple[1]
            self.make = car_tuple[2]
            self.model = car_tuple[3]
            self.year = car_tuple[4]
            self.lastOD = car_tuple[5]
            self.lastGas = car_tuple[6]
            self.locNum = car_tuple[7]

def cars_for_location(locNum):
    cursor = connection.cursor()
    cursor.execute('''
        select * from car where locNum = %s
    ''',
    [locNum])

    cars = [Car(t) for t in cursor.fetchall()]

    return cars

def all_cars():
    cursor = connection.cursor()
    cursor.execute('''
        select * from car
    ''')

    cars = [Car(t) for t in cursor.fetchall()]

    return cars

def car_by_id(id):
    cursor = connection.cursor()
    cursor.execute('''
        select * from car where CarNum = %s
        '''
    , [id])

    car_tuple = cursor.fetchone()

    return Car(car_tuple)


def insert_car(car_dict):
    d = car_dict
    cursor = connection.cursor()

    # Data modifying operation - commit required
    cursor.execute('''
        insert into Car values
        (DEFAULT, %s, %s, %s, %s, %s, %s, %s);
    ''',
    [
        d['vin'],
        d['make'],
        d['model'],
        d['year'],
        d['lastOD'],
        d['lastGas'],
        d['locNum'],
    ])
    transaction.commit_unless_managed()


class Member(object):

    def __init__(self, mem_tuple):
        self.id = mem_tuple[0]
        self.name = mem_tuple[1]
        self.address = mem_tuple[2]
        self.phonNum = mem_tuple[3]
        self.email = mem_tuple[4]
        self.license = mem_tuple[5]
        self.anniversary = mem_tuple[6]
        self.ccnum = mem_tuple[7]
        self.ccexp = mem_tuple[8]

def all_members():
    cursor = connection.cursor()
    cursor.execute('''
        select * from Member
    ''')

    items = [Member(t) for t in cursor.fetchall()]

    return items

def member_by_id(id):
    cursor = connection.cursor()
    cursor.execute('''
        select * from member where MemNum = %s
        '''
    , [id])

    mem_tuple = cursor.fetchone()

    return Member(mem_tuple)

def insert_member(member_dict):
    d = member_dict
    cursor = connection.cursor()

    # Data modifying operation - commit required
    cursor.execute('''
        insert into Member values
        (DEFAULT, %s, %s, %s, %s, %s, %s, %s, %s);
    ''',
    [
        d['name'],
        d['address'],
        d['phonNum'],
        d['email'],
        d['license'],
        datetime.date.today(),
        d['ccnum'],
        parser.parse(d['ccexp'] + "-01"),
    ])
    transaction.commit_unless_managed()

class Location(object):

    def __init__(self, tuple):
        self.id = tuple[0]
        self.address = tuple[1]
        self.numSpaces = tuple[2]

def all_locations():
    cursor = connection.cursor()
    cursor.execute('''
        select * from Location
    ''')

    locations = [Location(t) for t in cursor.fetchall()]

    return locations

def location_by_id(id):
    cursor = connection.cursor()
    cursor.execute('''
        select * from location where LocNum = %s
        '''
    , [id])

    loc = Location(cursor.fetchone())

    return loc