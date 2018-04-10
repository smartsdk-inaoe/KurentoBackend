/* Autogenerated with kurento-module-creator */

#ifndef __OUTDOOR_PEOPLE_DETECTOR_IMPL_FACTORY_HPP__
#define __OUTDOOR_PEOPLE_DETECTOR_IMPL_FACTORY_HPP__

#include "OutdoorPeopleDetectorImpl.hpp"
#include "OpenCVFilterImplFactory.hpp"
#include <Factory.hpp>
#include <MediaObjectImpl.hpp>
#include <boost/property_tree/ptree.hpp>

namespace kurento
{
namespace module
{
namespace outdoorpeopledetector
{

class OutdoorPeopleDetectorImplFactory : public virtual OpenCVFilterImplFactory
{
public:
  OutdoorPeopleDetectorImplFactory () {};

  virtual std::string getName () const {
    return "OutdoorPeopleDetector";
  };

private:

  virtual MediaObjectImpl *createObjectPointer (const boost::property_tree::ptree &conf, const Json::Value &params) const;

  MediaObjectImpl *createObject (const boost::property_tree::ptree &conf, std::shared_ptr<MediaPipeline> mediaPipeline) const;
};

} /* outdoorpeopledetector */
} /* module */
} /* kurento */

#endif /*  __OUTDOOR_PEOPLE_DETECTOR_IMPL_FACTORY_HPP__ */