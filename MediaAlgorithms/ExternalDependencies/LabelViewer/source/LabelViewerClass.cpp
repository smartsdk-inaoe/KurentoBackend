#include "LabelViewer.hpp"
#include <tinyxml2.h>

using namespace tinyxml2;

LabelViewer::LabelViewer()
{
	colors_loaded = false;
	events_loaded = false;
}

bool LabelViewer::loadColors(std::string file)
{
	if(colors_loaded) return false;

	std::ifstream infile;
	infile.open(file);

	if(!infile.is_open()) return false;

	int size;
	infile >> size;

	for(int i = 0; i < size; i++)
	{
		std::string record;
		infile >> record;
		std::size_t first_index = record.find_first_of(":");
		std::size_t second_index = record.find_first_of(".");
		std::size_t third_index = record.find_first_of(".",second_index+1);
		std::string cname = record.substr(0,first_index);
		int b_val = std::stoi(record.substr(first_index+1,second_index-first_index-1));
		int g_val = std::stoi(record.substr(second_index+1,third_index-second_index-1));
		int r_val = std::stoi(record.substr(third_index+1));

		color_value.push_back(cv::Scalar(b_val,g_val,r_val));
		color_name.push_back(cname);
	}

	infile.close();

	colors_loaded = true;
	return true;
}

bool LabelViewer::loadEvents(std::string file)
{
	if(events_loaded || !colors_loaded) return false;

	std::ifstream infile;
	infile.open(file);

	if(!infile.is_open()) return false;

	int size;
	infile >> size;

	for(int i = 0; i < size; i++)
	{
		//Example of a record
		std::string record;
		infile >> record;
		std::size_t first_index = record.find_first_of(":");
		std::size_t second_index = record.find_first_of(":",first_index+1);
		std::string e_name = record.substr(0,first_index);
		std::string e_color = record.substr(first_index+1,second_index-first_index-1);
		std::string e_tag = record.substr(second_index+1);

		//Save the color for this event
		std::vector<std::string>::iterator it_;
		it_ = std::find(color_name.begin(),color_name.end(),e_color);
		if(it_ != color_name.end())
		{
			std::size_t pos = std::distance(color_name.begin(),it_);
			event_color_index.push_back(pos);
		}
		else
			continue;

		//Save the event type
		event_name.push_back(e_name);

		//Save the labeling type
		TAG tag;
		if(e_tag=="EC") tag = ENCLOSING_CIRCLE;
		else if(e_tag == "BB") tag = BOUNDING_BOX;
		else if(e_tag == "FO") tag = FILL_OBJECT;
		else tag = TEXT_TAG;
		event_tag.push_back(tag);
	}

	infile.close();

	events_loaded = true;
	return true;
}

bool LabelViewer::tagEvent(cv::Mat &img, std::string event,std::string text, cv::Point coordinate, float radius, cv::Rect bounding_box, cv::Mat mask)
{
	if(!colors_loaded || !events_loaded) return false;

	if(img.empty() || img.type() != CV_8UC3) return false;

	for(unsigned int i = 0; i < event_name.size(); i++)
	{
		if(event_name[i] == event && !event_flag[i]) break;

		if(event_name[i] == event)
		{
			switch(event_tag[i])
			{
				case ENCLOSING_CIRCLE:
				{
					if(radius <= 0 || coordinate.x < 0 || coordinate.y < 0 || coordinate.x >= img.cols || coordinate.y >= img.rows)
						return false;

					cv::circle(img,coordinate,radius,color_value[event_color_index[i]]);
				}
				break;

				case BOUNDING_BOX:
				{
					if(bounding_box.x < 0 || bounding_box.y < 0 || bounding_box.width <= 0 || bounding_box.height <= 0)
						return false;

					cv::rectangle(img,bounding_box,color_value[event_color_index[i]]);
				}
				break;

				case FILL_OBJECT:
				{
					if(mask.empty() || mask.type() != CV_8UC1 || mask.cols != img.cols || mask.rows != img.rows)
						return false;

					img.setTo(color_value[event_color_index[i]],mask);
				}
				break;

				case TEXT_TAG:
				{
					if(text == "" || coordinate.x < 0 || coordinate.y < 0 || coordinate.x >= img.cols || coordinate.y >= img.rows)
						return false;

					cv::putText(img,text,coordinate,CV_FONT_HERSHEY_SIMPLEX,1.0,color_value[event_color_index[i]],2);
				}
				break;
			}

			return true;
		}
	}

	return false;
}

int LabelViewer::nEvents()
{
	return static_cast<int>(event_name.size());
}

std::string LabelViewer::getEvent(int index)
{
    if(index < 0 || index >= static_cast<int>(event_name.size()))
        return std::string();

    return event_name[index];
}

bool LabelViewer::migrateColors(std::string newFile)
{
	if(!colors_loaded) return false;

	XMLDocument xmlDoc;
	XMLNode *pRoot = xmlDoc.NewElement("ColorTable");
	xmlDoc.InsertFirstChild(pRoot);

	XMLElement *pElement;
	for(unsigned int i = 1; i < color_value.size(); i++)
	{
		pElement = xmlDoc.NewElement("Color");
		pElement->SetAttribute("Name",color_name[i].c_str());
		pElement->SetAttribute("B",color_value[i][0]);
		pElement->SetAttribute("G",color_value[i][1]);
		pElement->SetAttribute("R",color_value[i][2]);
		pRoot->InsertEndChild(pElement);
	}

	xmlDoc.SaveFile(newFile.c_str());
	return true;
}

bool LabelViewer::XMLCheckResult(XMLError xmlResult)
{
	return (xmlResult == XML_SUCCESS);
}

bool LabelViewer::loadColorsFromXML(std::string file)
{
	XMLDocument xmlDoc;
	XMLError result = xmlDoc.LoadFile(file.c_str());
	if(!XMLCheckResult(result)) return false;

	XMLNode *pRoot = xmlDoc.FirstChild();
	if(pRoot == nullptr) return false;

	XMLElement *pElement = pRoot->FirstChildElement("Color");
	std::vector<cv::Scalar> input_color_value;
	std::vector<std::string> input_color_name;

	while(pElement != nullptr)
	{
		std::string name_,b_,g_,r_;
		const char* ptr;

		ptr = pElement->Attribute("Name");
		if(ptr == nullptr) return false;
		name_ = ptr;
		ptr = pElement->Attribute("B");
		if(ptr == nullptr) return false;
		b_ = ptr;
		ptr = pElement->Attribute("G");
		if(ptr == nullptr) return false;
		g_ = ptr;
		ptr = pElement->Attribute("R");
		if(ptr == nullptr) return false;
		r_ = ptr;

		input_color_value.push_back(cv::Scalar(std::stoi(b_),std::stoi(g_),std::stoi(r_)));
		input_color_name.push_back(name_);

		pElement = pElement->NextSiblingElement("Color");
	}

	color_value = input_color_value;
	color_name = input_color_name;

	colors_loaded = true;
	return true;
}

bool LabelViewer::addEvent(std::string EventName, std::string EventColor, std::string EventMethod, bool EventFlag)
{
	//Check that the colors have already been loaded
	if(!colors_loaded) return false;

	//Check that the given drawing method is a valid one
	TAG tag;
	if(EventMethod == "EnclosingCircle") tag = ENCLOSING_CIRCLE;
	else if(EventMethod == "BoundingBox") tag = BOUNDING_BOX;
	else if(EventMethod == "FillingObject") tag = FILL_OBJECT;
	else if(EventMethod == "TextTag") tag = TEXT_TAG;
	else return false;

	//Chaeck that the given color is a valid one
	std::vector<std::string>::iterator it_;
	std::size_t index;
	it_ = std::find(color_name.begin(),color_name.end(),EventColor);
	if(it_ != color_name.end()) index = std::distance(color_name.begin(),it_);
	else return false;

	//Store the event
	event_name.push_back(EventName);
	event_color_index.push_back(index);
	event_tag.push_back(tag);
	event_flag.push_back(EventFlag);

	events_loaded = true;
	return true;
}

void LabelViewer::clearEvents()
{
	event_name.clear();
	event_color_index.clear();
	event_tag.clear();
	event_flag.clear();
}



















