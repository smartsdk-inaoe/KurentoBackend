/* Autogenerated with kurento-module-creator */

#ifndef __VISUALIZER_INTERNAL_HPP__
#define __VISUALIZER_INTERNAL_HPP__

#include "Visualizer.hpp"

namespace kurento
{
class JsonSerializer;
}

namespace kurento
{
class MediaPipeline;
} /* kurento */

namespace kurento
{
namespace module
{
namespace visualizer
{

class VisualizerMethodSetConfiguration
{
public:
  VisualizerMethodSetConfiguration() {}
  ~VisualizerMethodSetConfiguration() {}

  void invoke (std::shared_ptr<Visualizer> obj);
  void Serialize (JsonSerializer &serializer);

  std::string getFile () {
    return file;
  }

  void setFile (const std::string &file) {
    this->file = file;
  }

private:
  std::string file;
};

class VisualizerConstructor
{
public:
  VisualizerConstructor () {}
  ~VisualizerConstructor () {}

  void Serialize (JsonSerializer &serializer);

  std::shared_ptr<MediaPipeline> getMediaPipeline ();

  void setMediaPipeline (std::shared_ptr<MediaPipeline> mediaPipeline) {
    this->mediaPipeline = mediaPipeline;
  }

private:
  std::shared_ptr<MediaPipeline> mediaPipeline;
};

} /* visualizer */
} /* module */
} /* kurento */

#endif /*  __VISUALIZER_INTERNAL_HPP__ */