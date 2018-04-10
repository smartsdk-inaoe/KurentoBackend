~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~READ-ME~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This repository  contains a set of libraries  that some of the  "Filters" need  in order  to work.


######################################## BGSLIBRARY-MASTER #######################################
The "bgslibrary-master" directory  contains  the files  used for the  background subtraction task.
The only filter that need this dependencny is the "Subsense Filter".


########################################### VPDETECTOR ###########################################
The "VPDetector" holds the files used by the  "Indoordetector Filter" and "Outdoordetector Filter"
to do the people and vehicle detection tasks.


########################################### LABELVIEWER ##########################################
The "LabelViewer" directory contains the files needed to draw or highlight a specific event accor-
ding to the  value of a "EventTable" entity inside  the OCB. The  classes inside this library only
performs  the drawing task. In order for a "filter" to listen to an user request, some extra logic
must be implemented on such "filter".


####################################### CONTEXT-BROKER-API #######################################
The ContextBrokerAPI.py file holds a set of functions that are useful for communicating with the
OCB, such as adding, updating, querying and deleting entities, also registiring and deleting subs-
criptions.


########################################### JSON FILES ###########################################
The json files in this repository are examples of files that can be used with the ContextBrokerAPI
in order to interact with the OCB.
