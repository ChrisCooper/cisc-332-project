from django.conf.urls import patterns, include, url

urlpatterns = patterns('carshare.views',
    url(r'^$', 'index', name="home"),
    url(r'^reservations/today$', 'today_reservations', name="today_reservations"),
)
