/**
  * @file LabelViewer.hpp
  * @version 1.0
  * @date 29/03/2017
  * @author Sergio A. Serrano
  * @title Label Visualization
  * @brief This file contains a class that defines a procedure to draw labels related to user defined events.
  */
#include <sstream>
#include <fstream>
#include <string>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/opencv.hpp>
#include <vector>
#include <algorithm>
#include <tinyxml2.h>

/**
 * @brief The TAG enum defines a set of tag procedures.
 */
enum TAG
{
	ENCLOSING_CIRCLE,
	BOUNDING_BOX,
	FILL_OBJECT,
	TEXT_TAG
};

/**
 * @brief The LabelViewer class enables the user to define events and the way they should be displayed on the screen.
 */
class LabelViewer
{
	private:

		std::vector<cv::Scalar> color_value;
		std::vector<std::string> color_name;
		bool colors_loaded;
		std::vector<std::string> event_name;
		std::vector<int> event_color_index;
		std::vector<TAG> event_tag;
		std::vector<bool> event_flag;
		bool events_loaded;

	public:

                /**
                 * @brief Default constructor.
                 */
		LabelViewer();

                /**
                 * @brief This method loads from a '.dat' file a set of colors, in a BGR format, in order to highlight detected events in the best way posible.
                 * @param file Path to the colors set file
                 * @return Returns true if the file loads successfully
                 */
		bool loadColors(std::string file);

                /**
                 * @brief This method loads from a '.dat' file a set of user defined events.
                 * @param file Path to the events set file
                 * @return Returns true if the file loads successfully
                 */
		bool loadEvents(std::string file);

                /**
                 * @brief This method performes the label drawing operation.
                 * @param img Image on which the tag will be drawn
                 * @param event Name of the detected event. This event should be defined in the file loaded by loadEvents in order to correctly draw it
                 * @param text String the user wants to link to the detected event
                 * @param coordinate Point used to establish where either the text or circle will be drawn
                 * @param radius Radius for the enclosing circle
                 * @param bounding_box Rectangle that encapsulates a detected event or object
                 * @param mask Binary image whose non-zero pixel determine which pixel will be colored on img
                 * @return Returns true if the event was successfully tagged
                 */
		bool tagEvent(cv::Mat &img, std::string event,std::string text, cv::Point coordinate, float radius, cv::Rect bounding_box, cv::Mat mask);

                /**
                 * @brief This method returns the amount of available events.
                 * @return Returns the size of the set of defined events
                 */
		int nEvents();

                /**
                 * @brief This method gives access to the events defined by the user.
                 * @param index Integer used to access an element from the set of defined events
                 * @return Returns the name of the selected event
                 */
                std::string getEvent(int index);

                /**
                 * @brief This method saves the loaded colors, if any, into a XML file.
                 * @param newFile Name of the XML file
                 * @return True if saving operation was successfully done, False otherwise
                 */
		bool migrateColors(std::string newFile);

                /**
                 * @brief This method is used to check the result of some operation related to XML writing and reading.
                 * @param xmlResult XMLError instance to be checked
                 * @return True if 'xmlResult' was successful, False otherwise
                 */
		bool XMLCheckResult(tinyxml2::XMLError xmlResult);

                /**
                 * @brief This method is used to load a table of colors from a XML file.
                 * @param file Path to the file to be loaded
                 * @return True if the loading operation was successfully done, False otherwise
                 */
		bool loadColorsFromXML(std::string file);

                /**
                 * @brief This method is used for adding a new event to this instance.
                 * @param EventName Name of the event
                 * @param EventColor Color which the event should be highlighted with
                 * @param EventMethod Method used to highlight the event
                 * @param EventFlag A string conataining "True" or "False"
                 * @return True if the event was successfully added, False otherwise
                 */
		bool addEvent(std::string EventName, std::string EventColor, std::string EventMethod, bool EventFlag);

		void clearEvents();
};














