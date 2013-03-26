 
class Reservation(object):

    def __init__(self, res_tuple):
        self.id = res_tuple[0]
        self.pickupDate = res_tuple[1]
        self.pickupTime = res_tuple[2]
        self.duration = res_tuple[3]