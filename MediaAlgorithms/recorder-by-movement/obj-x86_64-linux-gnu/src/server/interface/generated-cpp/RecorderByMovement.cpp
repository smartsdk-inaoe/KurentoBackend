/* Autogenerated with kurento-module-creator */

#include "RecorderByMovement.hpp"
#include <mutex>

namespace kurento
{
namespace module
{
namespace recorderbymovement
{

static std::vector<std::string> hierarchyRecorderByMovement;
std::once_flag initFlagRecorderByMovement;

static void
initHierarchy ()
{
  hierarchyRecorderByMovement.push_back("kurento.OpenCVFilter");
  hierarchyRecorderByMovement.push_back("kurento.Filter");
  hierarchyRecorderByMovement.push_back("kurento.MediaElement");
  hierarchyRecorderByMovement.push_back("kurento.MediaObject");
}

const std::vector<std::string> &
RecorderByMovement::getHierarchy () const
{
  std::call_once (initFlagRecorderByMovement,initHierarchy);
  return hierarchyRecorderByMovement;
}

const std::string&
RecorderByMovement::getType () const {
  static std::string typeName = "RecorderByMovement";

  return typeName;
}

const std::string&
RecorderByMovement::getQualifiedType () const {
  static std::string qualifiedTypeName = getModule() + "." + getType();

  return qualifiedTypeName;
}

const std::string&
RecorderByMovement::getModule () const {
  static std::string moduleName =  "recorderbymovement";

  return moduleName;
}

} /* recorderbymovement */
} /* module */
} /* kurento */
