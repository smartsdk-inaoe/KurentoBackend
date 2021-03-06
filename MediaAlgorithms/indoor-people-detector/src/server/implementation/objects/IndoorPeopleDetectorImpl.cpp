/* Autogenerated with kurento-module-creator */

#include <gst/gst.h>
#include "MediaPipeline.hpp"
#include <IndoorPeopleDetectorImplFactory.hpp>
#include "IndoorPeopleDetectorImpl.hpp"
#include <jsonrpc/JsonSerializer.hpp>
#include <KurentoException.hpp>
#include "MediaPipelineImpl.hpp"

#define GST_CAT_DEFAULT kurento_indoor_people_detector_impl
GST_DEBUG_CATEGORY_STATIC (GST_CAT_DEFAULT);
#define GST_DEFAULT_NAME "KurentoIndoorPeopleDetectorImpl"

namespace kurento
{
namespace module
{
namespace indoorpeopledetector
{

IndoorPeopleDetectorImpl::IndoorPeopleDetectorImpl (const boost::property_tree::ptree &config, std::shared_ptr<MediaPipeline> mediaPipeline) : OpenCVFilterImpl (config, std::dynamic_pointer_cast<MediaPipelineImpl> (mediaPipeline) )

{
}

void IndoorPeopleDetectorImpl::setDB (const std::string &db)
{
  IndoorPeopleDetectorOpenCVImpl::setDB (db);
}

void IndoorPeopleDetectorImpl::setConfiguration (const std::string &file)
{
  IndoorPeopleDetectorOpenCVImpl::setConfiguration (file);
}

MediaObjectImpl *
IndoorPeopleDetectorImplFactory::createObject (const boost::property_tree::ptree &config, std::shared_ptr<MediaPipeline> mediaPipeline) const
{
  return new IndoorPeopleDetectorImpl (config, mediaPipeline);
}

IndoorPeopleDetectorImpl::StaticConstructor IndoorPeopleDetectorImpl::staticConstructor;

IndoorPeopleDetectorImpl::StaticConstructor::StaticConstructor()
{
  GST_DEBUG_CATEGORY_INIT (GST_CAT_DEFAULT, GST_DEFAULT_NAME, 0,
                           GST_DEFAULT_NAME);
}

} /* indoorpeopledetector */
} /* module */
} /* kurento */
