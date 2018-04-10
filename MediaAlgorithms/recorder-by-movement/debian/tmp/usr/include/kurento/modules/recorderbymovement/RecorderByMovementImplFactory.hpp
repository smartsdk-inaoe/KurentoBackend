/* Autogenerated with kurento-module-creator */

#ifndef __RECORDER_BY_MOVEMENT_IMPL_FACTORY_HPP__
#define __RECORDER_BY_MOVEMENT_IMPL_FACTORY_HPP__

#include "RecorderByMovementImpl.hpp"
#include "OpenCVFilterImplFactory.hpp"
#include <Factory.hpp>
#include <MediaObjectImpl.hpp>
#include <boost/property_tree/ptree.hpp>

namespace kurento
{
namespace module
{
namespace recorderbymovement
{

class RecorderByMovementImplFactory : public virtual OpenCVFilterImplFactory
{
public:
  RecorderByMovementImplFactory () {};

  virtual std::string getName () const {
    return "RecorderByMovement";
  };

private:

  virtual MediaObjectImpl *createObjectPointer (const boost::property_tree::ptree &conf, const Json::Value &params) const;

  MediaObjectImpl *createObject (const boost::property_tree::ptree &conf, std::shared_ptr<MediaPipeline> mediaPipeline) const;
};

} /* recorderbymovement */
} /* module */
} /* kurento */

#endif /*  __RECORDER_BY_MOVEMENT_IMPL_FACTORY_HPP__ */