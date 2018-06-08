/* Autogenerated with kurento-module-creator */

#include <gst/gst.h>
#include "MediaPipeline.hpp"
#include <OutdoorPeopleDetectorImplFactory.hpp>
#include "OutdoorPeopleDetectorImpl.hpp"
#include <jsonrpc/JsonSerializer.hpp>
#include <KurentoException.hpp>
#include "MediaPipelineImpl.hpp"

#define GST_CAT_DEFAULT kurento_outdoor_people_detector_impl
GST_DEBUG_CATEGORY_STATIC (GST_CAT_DEFAULT);
#define GST_DEFAULT_NAME "KurentoOutdoorPeopleDetectorImpl"

namespace kurento
{
namespace module
{
namespace outdoorpeopledetector
{

OutdoorPeopleDetectorImpl::OutdoorPeopleDetectorImpl (const boost::property_tree::ptree &config, std::shared_ptr<MediaPipeline> mediaPipeline) : OpenCVFilterImpl (config, std::dynamic_pointer_cast<MediaPipelineImpl> (mediaPipeline) )

{
}

void OutdoorPeopleDetectorImpl::setDB (const std::string &db)
{
  OutdoorPeopleDetectorOpenCVImpl::setDB (db);
}

void OutdoorPeopleDetectorImpl::setConfiguration (const std::string &file)
{
  OutdoorPeopleDetectorOpenCVImpl::setConfiguration (file);
}

MediaObjectImpl *
OutdoorPeopleDetectorImplFactory::createObject (const boost::property_tree::ptree &config, std::shared_ptr<MediaPipeline> mediaPipeline) const
{
  return new OutdoorPeopleDetectorImpl (config, mediaPipeline);
}

OutdoorPeopleDetectorImpl::StaticConstructor OutdoorPeopleDetectorImpl::staticConstructor;

OutdoorPeopleDetectorImpl::StaticConstructor::StaticConstructor()
{
  GST_DEBUG_CATEGORY_INIT (GST_CAT_DEFAULT, GST_DEFAULT_NAME, 0,
                           GST_DEFAULT_NAME);
}

} /* outdoorpeopledetector */
} /* module */
} /* kurento */
