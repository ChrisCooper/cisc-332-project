from django.shortcuts import render
from django.db import models
from django.db import connection, transaction

import datetime

from carshare.models import *

def index(request):
    return render(request, 'index.html')


def today_reservations(request):

    dateStr = datetime.date.today().isoformat()

    cursor = connection.cursor()
    cursor.execute('''
        select * from reservation where PickupDate = %s
        '''
    , [dateStr])

    res_tuples = cursor.fetchall()

    reservations = [Reservation(t) for t in res_tuples]

    return render(request, 'reservations_today.html', {'reservations': reservations})
