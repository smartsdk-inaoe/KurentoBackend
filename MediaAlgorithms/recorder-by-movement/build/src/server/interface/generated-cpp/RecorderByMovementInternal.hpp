/* Autogenerated with kurento-module-creator */

#ifndef __RECORDER_BY_MOVEMENT_INTERNAL_HPP__
#define __RECORDER_BY_MOVEMENT_INTERNAL_HPP__

#include "RecorderByMovement.hpp"

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
namespace recorderbymovement
{

class RecorderByMovementMethodLoadConfig
{
public:
  RecorderByMovementMethodLoadConfig() {}
  ~RecorderByMovementMethodLoadConfig() {}

  void invoke (std::shared_ptr<RecorderByMovement> obj);
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

class RecorderByMovementConstructor
{
public:
  RecorderByMovementConstructor () {}
  ~RecorderByMovementConstructor () {}

  void Serialize (JsonSerializer &serializer);

  std::shared_ptr<MediaPipeline> getMediaPipeline ();

  void setMediaPipeline (std::shared_ptr<MediaPipeline> mediaPipeline) {
    this->mediaPipeline = mediaPipeline;
  }

private:
  std::shared_ptr<MediaPipeline> mediaPipeline;
};

} /* recorderbymovement */
} /* module */
} /* kurento */

#endif /*  __RECORDER_BY_MOVEMENT_INTERNAL_HPP__ */
