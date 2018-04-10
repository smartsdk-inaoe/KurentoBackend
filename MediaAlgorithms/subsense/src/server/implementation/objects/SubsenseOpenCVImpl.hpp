/* Autogenerated with kurento-module-creator */

#ifndef __SUBSENSE_OPENCV_IMPL_HPP__
#define __SUBSENSE_OPENCV_IMPL_HPP__

#include <OpenCVProcess.hpp>
#include "Subsense.hpp"
#include <EventHandler.hpp>
#include <SuBSENSE.h>

namespace kurento
{
namespace module
{
namespace subsense
{

class SubsenseOpenCVImpl : public virtual OpenCVProcess
{

private:

		SuBSENSEBGS* bgs;


public:

  SubsenseOpenCVImpl ();

  virtual ~SubsenseOpenCVImpl () ;

  virtual void process (cv::Mat &mat);

};

} /* subsense */
} /* module */
} /* kurento */

#endif /*  __SUBSENSE_OPENCV_IMPL_HPP__ */