from django.shortcuts import render
from django.db import models

import datetime
from dateutil import parser

from carshare.models import *

def index(request):
    return render(request, 'index.html')


def reservations(request):

    filter_date = datetime.date.today()
    res_tuples = []

    if 'date' in request.GET and request.GET['date']:
        filter_date = request.GET['date']
        filter_date = parser.parse(filter_date)
        res_tuples = reservations_for_day(filter_date)
        reservations = [Reservation(t) for t in res_tuples]
    else:
        reservations = all_reservations()
    
    for res in reservations:
        res.car = car_by_id(res.carNum)
        res.member = member_by_id(res.memNum)
        res.location = location_by_id(res.locNum)

    return render(request, 'reservations_today.html', {'reservations': reservations})

def usage_history(request, carNum):

    car = car_by_id(carNum)
    
    today = datetime.date.today()

    res_tuples = reservations_for_day(filter_date)

    reservations = [Reservation(t) for t in res_tuples]

    for res in reservations:
        res.car = car_by_id(res.carNum)
        res.member = member_by_id(res.memNum)
        res.location = location_by_id(res.locNum)

    return render(request, 'reservations_today.html', {'reservations': reservations})

def cars(request):

    if request.method == 'POST':
        insert_car(request.POST)

    cars = all_cars()

    for car in cars:
        car.location = location_by_id(car.locNum)

    locations = all_locations()

    return render(request, 'cars.html', {'cars': cars, 'locations': locations})

def members(request):

    if request.method == 'POST':
        insert_member(request.POST)

    members = all_members()

    return render(request, 'members.html', {'members': members})
