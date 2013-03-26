from django.conf.urls import patterns, include, url

urlpatterns = patterns('carshare.views',
    url(r'^$', 'index', name="home"),
    url(r'^reservations$', 'reservations', name="reservations"),
    url(r'^cars$', 'cars', name="cars"),
    url(r'^members$', 'members', name="members"),

)
