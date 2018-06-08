/* Autogenerated with kurento-module-creator */

#ifndef __VISUALIZER_IMPL_HPP__
#define __VISUALIZER_IMPL_HPP__

#include "OpenCVFilterImpl.hpp"
#include "Visualizer.hpp"
#include <EventHandler.hpp>
#include <boost/property_tree/ptree.hpp>
#include "VisualizerOpenCVImpl.hpp"

namespace kurento
{
namespace module
{
namespace visualizer
{
class VisualizerImpl;
} /* visualizer */
} /* module */
} /* kurento */

namespace kurento
{
void Serialize (std::shared_ptr<kurento::module::visualizer::VisualizerImpl> &object, JsonSerializer &serializer);
} /* kurento */

namespace kurento
{
class MediaPipelineImpl;
} /* kurento */

namespace kurento
{
namespace module
{
namespace visualizer
{

class VisualizerImpl : public OpenCVFilterImpl, public virtual Visualizer, public virtual VisualizerOpenCVImpl
{

public:

  VisualizerImpl (const boost::property_tree::ptree &config, std::shared_ptr<MediaPipeline> mediaPipeline);

  virtual ~VisualizerImpl () {};

  void setConfiguration (const std::string &file);

  /* Next methods are automatically implemented by code generator */
  virtual bool connect (const std::string &eventType, std::shared_ptr<EventHandler> handler);
  virtual void invoke (std::shared_ptr<MediaObjectImpl> obj,
                       const std::string &methodName, const Json::Value &params,
                       Json::Value &response);

  virtual void Serialize (JsonSerializer &serializer);

private:

  class StaticConstructor
  {
  public:
    StaticConstructor();
  };

  static StaticConstructor staticConstructor;

};

} /* visualizer */
} /* module */
} /* kurento */

#endif /*  __VISUALIZER_IMPL_HPP__ */
